-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Vite server keymaps
vim.keymap.set("n", "<leader>s", ":ViteServerStart<CR>", { desc = "Vite Server Start" })
vim.keymap.set("n", "<leader>x", ":ViteServerStop<CR>", { desc = "Vite Server Stop" })

-- Função para abrir o Gemini CLI em um terminal flutuante
function open_gemini_cli()
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  })

  vim.fn.termopen("gemini", {
    on_exit = function()
      vim.api.nvim_win_close(win, true)
    end,
  })
  vim.cmd("startinsert")
end

-- Atalho para o Gemini CLI
vim.keymap.set("n", "<leader>gt", "<cmd>lua open_gemini_cli()<CR>", { desc = "Abrir Gemini CLI" })
