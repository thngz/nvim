return {
  "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "php", "javascript", "typescript", "html", "svelte"},
          sync_install = false,
          highlight = { 
            enable = true,
            additional_vim_regex_highlighting = true,
          },
          auto_install = true,
          indent = { enable = true },  
        })
    end
}

