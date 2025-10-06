return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      -- Carrega os módulos que serão usados
      local telescope = require("telescope.builtin")

      -- Configura o Telescope e suas extensões
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "%.git/", "%.cache/" },
          preview = {
            treesitter = false, -- DESABILITA o Treesitter no preview
          },
        },
      })

      -- Mapeamentos de teclas
      local map = vim.keymap.set
      map("n", "<leader>f", telescope.find_files, { desc = "Find Files" })
      map("n", "<leader>fg", telescope.live_grep, { desc = "Live Grep" })
      map("n", "<leader>fb", telescope.buffers, { desc = "Buffers" })
      map("n", "<leader>fr", telescope.oldfiles, { desc = "Recent Files" })
    end,
  },
}
