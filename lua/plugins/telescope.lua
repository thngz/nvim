return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
     dependencies = { 'nvim-lua/plenary.nvim' },

    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = {'^node_modules/', '.wwwroot/', '.bin/', '.obj/'},
            }
        })
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

        vim.api.nvim_set_keymap(
            "n",
            "<leader>fb",
            ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
            { noremap = true }
        )
    end
}

