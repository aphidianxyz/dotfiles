local options = {
	-- UI
	number = true,
	termguicolors = true,
	cursorline = true,
	signcolumn = "yes",
	scrolloff = 8,
	sidescrolloff = 4,
	linebreak = true,
	splitright = true,
	splitbelow = true,

	-- completion
	completeopt = "menuone,noinsert,noselect",

	-- tabs/indents
	tabstop = 4,
	shiftwidth = 4,
	softtabstop = 4,
	expandtab = true,

	-- searching
	ignorecase = true,
	smartcase = true,
	hlsearch = true,
	incsearch = true,

	-- clipboard
    clipboard = 'unnamedplus',

	-- recovery files
	swapfile = false,
	undofile = true,
	backup = false,

	-- other
	mouse = "a",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
