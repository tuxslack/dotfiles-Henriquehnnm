return {
  "stevearc/conform.nvim",
  opts = {
    -- formatadores por filetype
    formatters_by_ft = {
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },

      -- Python: usa Black (e opcionalmente isort antes)
      python = { "isort", "black" }, -- executa isort depois black
    },

    -- configurações adicionais (opcional)
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },

    -- configurações dos formatadores
    formatters = {
      black = {
        command = "black",
        args = { "--quiet", "-" },
        stdin = true,
      },
      isort = {
        command = "isort",
        args = { "--quiet", "-" },
        stdin = true,
      },
    },
  },
}
