# ~/.config/qutebrowser/config.py

# Carregar a configuração automática
config.load_autoconfig()

# Importar e configurar o tema Rose Pine
import rosepine
rosepine.setup(c, 'rose-pine', True)

# Configurações de abas
c.tabs.padding = {"top": 4, "bottom": 4, "left": 8, "right": 8}  # Espaçamento interno das abas
c.tabs.indicator.width = 4  # Largura do indicador de carregamento
c.tabs.indicator.padding = {"top": 2, "bottom": 2, "left": 2, "right": 2}  # Espaçamento do indicador
c.tabs.favicons.show = "never"
c.tabs.max_width = 200  # Largura máxima das abas
c.tabs.min_width = 100  # Largura mínima das abas

# Configurações da barra de status
c.statusbar.widgets = [
    "url",  # Exibe a URL atual
    "scroll",  # Exibe a posição de rolagem
    "history",  # Navegação no histórico
    "search_match",  # Contagem de correspondências de pesquisa
    "tabs",  # Exibe o número da aba atual
    "progress",  # Barra de progresso de carregamento
]
c.statusbar.padding = {"top": 2, "bottom": 2, "left": 2, "right": 2}  # Padding da barra de status

# Outras configurações úteis
c.tabs.show = 'always'  # Sempre exibe a barra de abas
c.statusbar.show = 'always'  # Sempre exibe a barra de status
c.tabs.position = 'top'  # Posiciona as abas no topo
c.tabs.mousewheel_switching = True  # Habilita a troca de abas com o scroll do mouse
c.tabs.select_on_remove = 'prev'  # Seleciona a aba anterior ao fechar a atual
