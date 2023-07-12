local plugins = {
    {
      "rcarriga/nvim-dap-ui",
      dependencies = "mfussenegger/nvim-dap",
      config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
      end
    },
    {
      "mfussenegger/nvim-dap",
      config = function(_, opts)
        require("core.utils").load_mappings("dap")
      end
    },
    {
         "mfussenegger/nvim-dap-python",
         ft = "python",
         dependencies = {
           "mfussenegger/nvim-dap",
           "rcarriga/nvim-dap-ui",
         },
         config = function(_, opts)
           local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
           require("dap-python").setup(path)
           require("core.utils").load_mappings("dap_python")
         end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        ft = {"python"},
        opts = function()
          return require "custom.configs.null-ls"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
          ensure_installed = {
            "black",
            "debugpy",
            "pyright",
          },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        "AckslD/swenv.nvim",
        opts = {
            get_venvs = function(venvs_path)
                return require("swenv.api").get_venvs(venvs_path)
            end,
        venvs_path = vim.fn.expand("~/micromamba/envs"),
        post_set_venv = function()
            vim.cmd("LspRestart")
        end
      },
    },
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy"
    },
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        cmd = "LazyGit",
        lazy = false,
    },
    {
        "christoomey/vim-tmux-navigator",
        lazy = false,
    },
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = {
                auto_trigger = true
            }
        }
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {},
        cmd = "Barbecue",
        event = "BufEnter"
    },
    {
        "sindrets/diffview.nvim",
        lazy = false
    },
}
return plugins
