# -*- coding: utf-8 -*-

import curses
import threading
import subprocess
import time
import sys
import os
import json

# A arte ASCII para o título
ASCII_TITLE = """
 █████                   ██████   ███
░░███                   ███░░███ ░░░
 ░███         ██████   ░███ ░░░  ████
 ░███        ███░░███ ███████   ░░███
 ░███       ░███ ░███░░░███░     ░███
 ░███      █░███ ░███  ░███      ░███
  ███████████░░██████   █████     █████
 ░░░░░░░░░░░  ░░░░░░   ░░░░░     ░░░░░

"""

# Uma classe simples para gerenciar a reprodução de música em uma thread separada.
class PlayerThread(threading.Thread):
    def __init__(self, state_dict):
        super().__init__()
        self.state_dict = state_dict
        self.current_process = None
        self.stop_event = threading.Event()

    def run(self):
        while not self.stop_event.is_set():
            # Verifica se há um novo comando para tocar
            if self.state_dict["command"] == "play":
                self.state_dict["status_text"] = "Carregando..."
                self.state_dict["is_playing"] = False
                self.state_dict["command"] = ""

                url = self.state_dict["current_url"]

                # Verifica se um processo já está em execução e o encerra
                if self.current_process:
                    self.current_process.terminate()
                    self.current_process.wait()

                # Usa mpv ou ffplay para reproduzir o áudio
                try:
                    # mpv command to play audio only
                    cmd = ['mpv', '--no-video', '--no-terminal', '--audio-display=no', url]
                    self.current_process = subprocess.Popen(cmd, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
                    self.state_dict["is_playing"] = True
                    self.state_dict["status_text"] = f"Tocando: {self.state_dict['current_title']}"
                except FileNotFoundError:
                    self.state_dict["status_text"] = "Erro: mpv ou ffplay não encontrado."
                    self.state_dict["is_playing"] = False
            elif self.state_dict["command"] == "stop":
                if self.current_process:
                    self.current_process.terminate()
                    self.current_process.wait()
                    self.current_process = None
                self.state_dict["is_playing"] = False
                self.state_dict["status_text"] = "Parado."
                self.state_dict["command"] = ""

            time.sleep(0.1)

    def stop(self):
        self.stop_event.set()
        if self.current_process:
            self.current_process.terminate()
            self.current_process.wait()


# Função para carregar a lista de músicas de um arquivo JSON
def load_music_list(filename=".music.json"):
    try:
        with open(filename, 'r', encoding='utf-8') as f:
            return json.load(f)
    except FileNotFoundError:
        print(f"Erro: O arquivo '{filename}' não foi encontrado.")
        sys.exit(1)
    except json.JSONDecodeError:
        print(f"Erro: O arquivo '{filename}' não é um JSON válido.")
        sys.exit(1)

# Classe principal para desenhar a interface de texto (TUI)
def draw_tui(stdscr, state_dict, music_list):
    curses.curs_set(0)  # Esconde o cursor
    stdscr.nodelay(1)  # Torna getch() não-bloqueador
    stdscr.clear()

    # Inicializa pares de cores
    curses.start_color()
    # Usa as cores padrão do terminal para o fundo
    curses.use_default_colors()
    curses.init_pair(1, curses.COLOR_CYAN, -1)
    curses.init_pair(2, curses.COLOR_MAGENTA, -1)
    curses.init_pair(3, curses.COLOR_GREEN, -1)
    curses.init_pair(4, curses.COLOR_YELLOW, -1)

    # Obtém as dimensões do terminal
    h, w = stdscr.getmaxyx()

    # Define tamanhos e posições das janelas
    status_height = 1

    # Cria janelas
    main_win = curses.newwin(h - status_height, w, 0, 0)
    status_win = curses.newwin(status_height, w, h - status_height, 0)

    # Loop principal da aplicação
    current_song_index = state_dict["current_song_index"]

    while True:
        # Verifica se houve redimensionamento
        new_h, new_w = stdscr.getmaxyx()
        if new_h != h or new_w != w:
            h, w = new_h, new_w
            main_win.erase()
            status_win.erase()
            main_win.resize(h - status_height, w)
            status_win.resize(status_height, w)
            main_win.mvwin(0, 0)
            status_win.mvwin(h - status_height, 0)

        # Desenha a lista de músicas
        main_win.clear()

        # Desenha o título com a arte ASCII centralizada, mas apenas se couber
        title_lines = ASCII_TITLE.split('\n')
        title_height = len(title_lines)
        max_title_width = max(len(line) for line in title_lines)

        title_start_y = 1

        if h > title_height + 5 and w > max_title_width + 5: # Adiciona margem para evitar truncamento
            for i, line in enumerate(title_lines):
                line_width = len(line)
                start_x = (w - line_width) // 2
                main_win.addstr(title_start_y + i, start_x, line, curses.color_pair(2))
            list_start_y = title_start_y + title_height + 2
        else:
            list_start_y = 1 # Se não couber o título, começa a lista no topo

        # Desenha a lista de músicas centralizada
        for idx, song in enumerate(music_list):
            y = list_start_y + idx
            if y < h - status_height - 1:
                title = song["title"]
                line_width = len(title)
                start_x = (w - line_width) // 2
                if idx == current_song_index:
                    main_win.attron(curses.A_REVERSE | curses.color_pair(1))
                    main_win.addstr(y, start_x, title)
                    main_win.attroff(curses.A_REVERSE | curses.color_pair(1))
                else:
                    main_win.addstr(y, start_x, title)

        # Desenha a barra de status
        status_win.clear()
        status_win.addstr(0, 2, "Status: " + state_dict["status_text"][:w - 12], curses.A_BOLD)
        status_win.addstr(0, w - 10, "[q: Sair]", curses.A_DIM)

        # Atualiza todas as janelas
        main_win.refresh()
        status_win.refresh()

        # Lida com a entrada do usuário
        key = stdscr.getch()

        # Navegação e comandos estilo Vim
        if key == ord('j'):  # Baixo
            current_song_index = (current_song_index + 1) % len(music_list)
            state_dict["current_song_index"] = current_song_index
        elif key == ord('k'):  # Cima
            current_song_index = (current_song_index - 1 + len(music_list)) % len(music_list)
            state_dict["current_song_index"] = current_song_index
        elif key in [10, 13]:  # Tecla Enter
            state_dict["current_url"] = music_list[current_song_index]["url"]
            state_dict["current_title"] = music_list[current_song_index]["title"]
            state_dict["command"] = "play"
        elif key == ord('q'):
            break

        time.sleep(0.05)  # Pequeno atraso para controlar a velocidade da animação

def main(stdscr):
    # Carrega a lista de músicas do arquivo JSON
    MUSIC_LIST = load_music_list()

    # Dicionário de estado compartilhado para comunicação entre threads
    state_dict = {
        "current_song_index": 0,
        "is_playing": False,
        "status_text": "Parado. Pressione Enter para tocar.",
        "current_url": None,
        "current_title": None,
        "command": "",
    }

    # Inicia a thread do reprodutor
    player_thread = PlayerThread(state_dict)
    player_thread.daemon = True
    player_thread.start()

    try:
        draw_tui(stdscr, state_dict, MUSIC_LIST)
    finally:
        player_thread.stop()
        player_thread.join()

if __name__ == "__main__":
    # Verifica se mpv ou ffplay estão instalados
    try:
        subprocess.run(["mpv", "--version"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=True)
    except (subprocess.CalledProcessError, FileNotFoundError):
        try:
            subprocess.run(["ffplay", "-version"], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=True)
        except (subprocess.CalledProcessError, FileNotFoundError):
            print("Erro: 'mpv' ou 'ffplay' não encontrado. Por favor, instale um deles para reproduzir o áudio.")
            sys.exit(1)

    try:
        curses.wrapper(main)
    except curses.error as e:
        print(f"Erro no Curses: {e}")
