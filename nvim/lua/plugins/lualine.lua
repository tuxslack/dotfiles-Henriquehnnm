-- ~/.config/nvim/lua/plugins/lualine.lua
return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Função para mostrar status do Vite Server
    local function vite_server_status()
      local ok, vs = pcall(require, "vite-server")
      if not ok then
        return ""
      end

      if vs.is_started then
        local url = vs.gen_url(vs.config.vite_cli_opts)
        return "󱐋 " .. url
      else
        return ""
      end
    end

    -- Adiciona o status do Vite na seção lualine_x
    opts.sections = opts.sections or {}
    opts.sections.lualine_x = opts.sections.lualine_x or {}

    -- Insere o vite_server_status no início da seção lualine_x com cores
    table.insert(opts.sections.lualine_x, 1, {
      vite_server_status,
      color = { fg = "#ffd866", gui = "bold" },
      separator = { left = "", right = "" },
    })

    return opts
  end,
}
