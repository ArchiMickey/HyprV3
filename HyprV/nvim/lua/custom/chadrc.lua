---@type ChadrcConfig 
 local M = {}
 M.ui = {
  theme = 'catppuccin',
  hl_add = {
    Venv = {
      bold = true,
      fg = "#b7bdf8"
    }
  },
  statusline = {
    overriden_modules = function()
      local st_modules = require "nvchad_ui.statusline.default"
      local current_venv = require('swenv.api').get_current_venv()
      local name

      if current_venv ~= nil
        then name = string.format(" %s ", current_venv.name)
      else
        name = " base "
      end

      return {
        mode = function()
          return st_modules.mode() .. "%#Venv#" .. name
        end,
      }
    end,
  },
    nvdash = {
        load_on_startup = true
    }
 }
 M.plugins = "custom.plugins"
 M.mappings = require "custom.mappings"
 return M
