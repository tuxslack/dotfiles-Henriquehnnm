return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    -- Ativa o tema Catppuccin Mocha
    vim.cmd("colorscheme catppuccin-mocha")

    -- Define o fundo geral do editor
    vim.cmd("highlight Normal guibg=#181825")

    -- Habilita o destaque da linha do cursor
    vim.opt.cursorline = true

    -- Remove o fundo do destaque da linha, mantendo só o gutter
    vim.cmd("highlight CursorLine guibg=NONE")
  end,
}
