-- Este arquivo configura o autocompletar para Python usando o LSP (Language Server Protocol).
-- LazyVim já tem `nvim-cmp` e `mason` configurados, então só precisamos dizer
-- qual servidor de linguagem usar para Python.

return {
  -- Configura os servidores de linguagem para várias linguagens.
  -- LazyVim usa `mason-lspconfig` para instalar e configurar automaticamente
  -- os servidores de linguagem definidos aqui.
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Adiciona o `pyright` para Python
        pyright = {},

        -- Servidores para JavaScript e TypeScript
        tsserver = {},

        -- Servidor para PHP
        -- Certifique-se de ter o `php` e o `composer` instalados no seu sistema
        intelephense = {},

        -- Servidor para Shell Script
        bashls = {},

        -- Servidor para HTML
        html = {},

        -- Servidor para CSS
        cssls = {},
      },
    },
  },
}
