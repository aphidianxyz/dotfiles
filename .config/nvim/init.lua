-- leader
vim.g.mapleader = ' '
vim.g.localleader = ' '

-- disable base file manager for nvim
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- plugins
vim.pack.add({
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    { src = 'https://github.com/ribru17/bamboo.nvim' },

    -- statusbar
    -- { src = 'https://github.com/nvim-tree/nvim-web-devicons' }, -- also a req. for nvim-tree
    { src = 'https://github.com/nvim-lualine/lualine.nvim' },

    { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context' },

    { src = 'https://github.com/akinsho/bufferline.nvim', tag = '*' },

    -- lsp 
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
    { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },

    { src = 'https:/github.com/rachartier/tiny-inline-diagnostic.nvim' },

    -- auto-completion
    { src = 'https://github.com/nvim-mini/mini.completion' },
    -- also a replacement dep for nvim-tree, and a regular dep for render-markdown
    { src = 'https://github.com/nvim-mini/mini.icons' },

    { src = 'https://github.com/nvim-mini/mini.clue' },

    { src = 'https://github.com/lewis6991/gitsigns.nvim' },

    { src = 'https://github.com/tpope/vim-fugitive' },

    { src = 'https://github.com/catgoose/nvim-colorizer.lua' },

    { src = 'https://github.com/nvim-tree/nvim-tree.lua' },

    { src = 'https://github.com/ibhagwan/fzf-lua' },

    -- requires md+md_inline, html, latex & yaml treesitter parsers to work properly
    { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },

    { src = 'https://github.com/numToStr/Comment.nvim' },

})
local inactive_plugins = vim.iter(vim.pack.get())
    :filter(function(x) return not x.active end)
    :map(function(x) return x.spec.name end)
    :totable()

if next(inactive_plugins) ~= nil then
    vim.pack.del(inactive_plugins)
end

-- autoload helper fn
local function load_config_dir(dir)
    -- $CONFIG/nvim/lua/[dir]
    local config_dir_path = vim.fn.stdpath("config") .. "/lua/" .. dir

    if vim.fn.isdirectory(config_dir_path) == 0 then
        return
    end

    local configs = vim.fn.globpath(config_dir_path, "*.lua", false, true)

    for _, config in ipairs(configs) do
        local config_name = vim.fn.fnamemodify(config, ":t:r")
        require(dir .. "." .. config_name)
    end
end

-- configs
load_config_dir("core")
load_config_dir("plugins")
load_config_dir("lsp")
