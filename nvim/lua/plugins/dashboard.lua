local astro_logo = {
  [[ ██████   █████                   █████   █████  ███                 ]],
  [[░░██████ ░░███                   ░░███   ░░███  ░░░                  ]],
  [[ ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████  ]],
  [[ ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███ ]],
  [[ ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███ ]],
  [[ ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███ ]],
  [[ █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████]],
  [[░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░ ]],
  [[                                                                     ]],
}

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        -- O logo é colocado aqui no 'header'
        header = table.concat(astro_logo, "\n"),

        -- Seus atalhos e outras customizações
        keys = {
          { key = "n", action = "<cmd>enew<cr>", desc = "New file" },
          { key = "f", action = "<cmd>Telescope find_files<cr>", desc = "Find files" },
          { key = "r", action = "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
          { key = "c", action = "<cmd>Telescope find_files cwd=~/.config/nvim<cr>", desc = "Config" },
          { key = "q", action = "<cmd>qa<cr>", desc = "Quit" },
        },
      },
    },
  },
}
