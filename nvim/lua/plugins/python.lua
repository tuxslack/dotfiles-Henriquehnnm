-- Este arquivo configura o autocompletar para Python usando o LSP (Language Server Protocol).
-- LazyVim já tem `nvim-cmp` e `mason` configurados, então só precisamos dizer
-- qual servidor de linguagem usar para Python.

return {
  -- Configura o servidor de linguagem para o Python (pyright).
  -- LazyVim usa `mason-lspconfig` para instalar e configurar automaticamente
  -- os servidores de linguagem definidos aqui.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Adiciona o `pyright` à lista de servidores de linguagem.
        -- O `mason.nvim` irá garantir que ele seja instalado.
        pyright = {},
      },
    },
  },
}
