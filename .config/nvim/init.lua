vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- stop cursor from jumping when pressing tab on a snippet
local group = vim.api.nvim_create_augroup("LuaSnipUnlink", { clear = true })

vim.api.nvim_create_autocmd("InsertLeave", {
  group = group,
  callback = function()
    local ok, ls = pcall(require, "luasnip")
    if not ok then return end

    local buf = vim.api.nvim_get_current_buf()
    if ls.session.current_nodes[buf] and not ls.session.jump_active then
      ls.unlink_current()
    end
  end,
})

