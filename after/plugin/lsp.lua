local lsp_zero = require('lsp-zero')

require('mason').setup({})

require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver', 'rust_analyzer', 'ruff_lsp', "pylsp", "clojure_lsp", "omnisharp", "gopls", "html", "cssls", "jsonls", "svelte"},

    handlers = {
        lsp_zero.default_setup,
    },
})

require('mason-lspconfig').setup({
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,

        omnisharp = function()
            require('lspconfig').omnisharp.setup({
                enable_roslyn_analyzers = true,
                enable_import_completion = true
            })
        end
    },
})

lsp_zero.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

local cmp = require('cmp')

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    mapping = cmp_mappings
})
lsp_zero.preset('recommended')
lsp_zero.setup()


vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format() end)
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end)
vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
