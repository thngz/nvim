return {
    { 'vim-airline/vim-airline' },

    {
        'numToStr/Comment.nvim',
        opts = {},
        lazy = false,
    },
    { 'tpope/vim-fugitive' },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    {
        'm4xshen/autoclose.nvim',
        config = function()
            require('autoclose').setup({})
        end
    },

    {
        'kosayoda/nvim-lightbulb',
        config = function()
            require("nvim-lightbulb").setup({
                autocmd = { enabled = true }
            })
        end
    },

    {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup({})
        end
    },

    { 'bluz71/vim-moonfly-colors' },
}
