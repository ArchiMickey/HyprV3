local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

M.de_tab = {
  i = {
    ["<S-Tab>"] = {"<C-d>"}
  }
}

M.swenv = {
  n = {
    ["<leader>Cc"] = {
      function()
        require('swenv.api').pick_venv()
      end,
      "Choose Env"
    }
  }
}

return M
