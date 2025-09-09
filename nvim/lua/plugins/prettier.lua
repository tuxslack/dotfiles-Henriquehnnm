-- ~/.config/nvim/lua/plugins/formatting/prettier.lua
return {
  "MunifTanjim/prettier.nvim",
  ft = { "javascript", "typescript", "html", "css", "json", "yaml", "markdown" }, -- Tipos de arquivo que o Prettier irá formatar
  config = function()
    require("prettier").setup({
      bin = "prettier", -- Caminho para o binário do Prettier
      filetypes = { "javascript", "typescript", "html", "css", "json", "yaml", "markdown" },
      cli_options = {
        single_quote = true, -- Exemplo de opção CLI
        semi = false, -- Exemplo de opção CLI
      },
    })
  end,
}
