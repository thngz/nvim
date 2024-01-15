return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
    
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {'L3MON4D3/LuaSnip'},
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()

      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()

      cmp.setup({
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        })
      })
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()

      --- if you want to know more about lsp-zero and mason.nvim
      --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)

      require('mason-lspconfig').setup({
        -- ensure_installed = {},
            ensure_installed = { 'tsserver', 'rust_analyzer', 'ruff_lsp', "pylsp", "clojure_lsp", "omnisharp", "gopls", "html", "cssls", "jsonls", "svelte"},
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        }
      })
            
    vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format() end)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
    end
  }


-----------------------------


    --
    -- {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    -- {
    --     'neovim/nvim-lspconfig',
    --     event = { "BufReadPre", "BufNewFile" },
    -- },
    -- 
    -- {'williamboman/mason.nvim'},
    -- {'williamboman/mason-lspconfig.nvim'},
    -- {'hrsh7th/cmp-nvim-lsp'},
    -- {'hrsh7th/nvim-cmp'},
    -- {'L3MON4D3/LuaSnip'},
    -- config = function()
    --
    --     local lsp_zero = require('lsp-zero')
    --
    --     require('mason').setup({})
    --
    --     require('mason-lspconfig').setup({
    --         ensure_installed = { 'tsserver', 'rust_analyzer', 'ruff_lsp', "pylsp", "clojure_lsp", "omnisharp", "gopls", "html", "cssls", "jsonls", "svelte"},
    --         handlers = {
    --             lsp_zero.default_setup,
    --         },
    --     })
    --
    --     require('mason-lspconfig').setup({
    --         handlers = {
    --             lsp_zero.default_setup,
    --             lua_ls = function()
    --                 local lua_opts = lsp_zero.nvim_lua_ls()
    --                 require('lspconfig').lua_ls.setup(lua_opts)
    --             end,
    --
    --             omnisharp = function()
    --                 require('lspconfig').omnisharp.setup({
    --                     enable_roslyn_analyzers = true,
    --                     enable_import_completion = true
    --                 })
    --             end
    --         },
    --     })
    --
    --     lsp_zero.on_attach(function(client, bufnr)
    --         -- see :help lsp-zero-keybindings
    --         -- to learn the available actions
    --         lsp_zero.default_keymaps({ buffer = bufnr })
    --     end)
    --
    --     local cmp = require('cmp')
    --
    --     local cmp_select = { behavior = cmp.SelectBehavior.Select }
    --     local cmp_mappings = lsp_zero.defaults.cmp_mappings({
    --         ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    --         ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    --         ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    --         ["<C-Space>"] = cmp.mapping.complete(),
    --     })
    --
    --     cmp.setup({
    --         sources = {
    --             { name = 'nvim_lsp' },
    --         },
    --         mapping = cmp_mappings
    --     })
    --     lsp_zero.preset('recommended')
    --     lsp_zero.setup()
    --
    --
    --     vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format() end)
    --     vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end)
    --     vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end)
    --     vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end)
}

