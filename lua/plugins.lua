return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'vim-airline/vim-airline'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('ishan9299/modus-theme-vim')
    -- vim.cmd('colorscheme modus-vivendi') -- Dark
    use('bluz71/vim-moonfly-colors')

    vim.cmd('colorscheme moonfly') -- Dark
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage LSP servers from neovim
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use('tpope/vim-fugitive')
    use('kylechui/nvim-surround')

    require('nvim-surround').setup()
    use 'm4xshen/autoclose.nvim'

    require('autoclose').setup()

    use('kosayoda/nvim-lightbulb')

    require("nvim-lightbulb").setup({
        autocmd = { enabled = true }
    })
    -- lua with packer.nvim
    use {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end,
    }
    use('christoomey/vim-tmux-navigator')

    use "nvim-lua/plenary.nvim" 
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    
end)
