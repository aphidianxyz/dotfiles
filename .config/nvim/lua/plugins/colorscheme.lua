require('bamboo').setup {
    style = 'multiplex',
    highlights = {
        TreesitterContext = { bg = "$bg1", fmt = "NONE" },
        TreesitterContextLineNumber = { bg = "$bg1", fmt = "NONE" },
    },
}

require('bamboo').load()
