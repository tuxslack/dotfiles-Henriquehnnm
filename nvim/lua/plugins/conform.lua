-- lua/plugins/conform.lua

return {
  "stevearc/conform.nvim",
  opts = {
    -- Aqui você define os formatadores para cada tipo de arquivo.
    -- O LazyVim já cuida da formatação ao salvar.
    formatters_by_ft = {
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },
      -- Adicione aqui outros formatos que você quer que o Prettier cuide
    },
  },
}
