return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-file-browser.nvim" },
  },
  config = function()
  -- Desativa o Netrw
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- Carrega os módulos que serão usados
  local telescope = require("telescope.builtin")

  -- Configura o Telescope e suas extensões
  require("telescope").setup({
    defaults = {
      file_ignore_patterns = { "%.git/", "%.cache/" },
    },
    extensions = {
      file_browser = {
        initial_mode = "normal",
      },
    },
  })

  -- Carregue a extensão *imediatamente* após o setup
  -- Isso garante que o módulo 'telescope.extensions.file_browser' esteja disponível
  require("telescope").load_extension("file_browser")

  -- Agora, podemos fazer o 'require' seguro para os mapeamentos e autocmds
  local telescope_fb = require("telescope").extensions.file_browser

  -- Mapeamentos de teclas
  local map = vim.keymap.set
  map("n", "<leader>f", telescope.find_files, { desc = "Find Files" })
  map("n", "<leader>fg", telescope.live_grep, { desc = "Live Grep" })
  map("n", "<leader>fb", telescope.buffers, { desc = "Buffers" })
  map("n", "<leader>fr", telescope.oldfiles, { desc = "Recent Files" })
  map("n", "<leader>e", telescope_fb.file_browser, { desc = "File Browser" })

  -- Autocomando para abrir o File Browser ao entrar em um diretório
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
    local argv = vim.fn.argv()
    if #argv == 1 and vim.fn.isdirectory(argv[1]) ~= 0 then
      telescope_fb.file_browser({
        path = argv[1],
      })
      end
      end,
  })
  end,
}
