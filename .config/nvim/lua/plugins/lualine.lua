-- see https://github.com/nvim-lualine/lualine.nvim#default-configuration for defaults
require('lualine').setup {
    options = {
        theme = 'bamboo'
    },
    sections = {
        lualine_b = {'branch', 'diagnostics'},
        lualine_x = {'filetype'},
        lualine_y = {}
    },
    inactive_sections = {
        lualine_a = {'filetype'},
        lualine_c = {'filename'},
    }
}
