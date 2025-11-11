return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

  -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
          require "configs.lspconfig"
        end,
    },
    {
        "S1M0N38/love2d.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "<leader>v", ft = "lua", desc = "LÖVE" },
            { "<leader>vv", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
            { "<leader>vs", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
        }
    },
    {
        "elmcgill/springboot-nvim",
        depedencies = {
            "neovim/nvim-lspconfig",
            "nvim-java/nvim-java",
            "nvim-tree/nvim-tree.lua",
        },
        config = function()
            local springboot_nvim = require("springboot-nvim")
            springboot_nvim.setup({})
        end
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        lazy = false,
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
    },
    {   -- fixes entering select mode when pressing tab
        "L3MON4D3/LuaSnip",
        history = true,
        region_check_events = "InsertEnter",
        delete_check_events = "TextChanged,InsertLeave"
    }



  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
