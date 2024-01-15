vim.g.mapleader = " "
vim.api.nvim_set_option('clipboard', 'unnamedplus')

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- allows to move visual selection block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- keeps cursor in the same place after using J
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n","<leader>sh", ":split<CR>")
vim.keymap.set("n","<leader>sv", ":vsplit<CR>")
-- open file explorer
vim.api.nvim_set_keymap('n', '<Leader>fe', ':e .<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>h', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', '<C-w>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
