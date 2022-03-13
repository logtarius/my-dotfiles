require'nvim-treesitter.configs'.setup {
    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,
  
    -- List of parsers to ignore installing
    ensure_installed = { "c", "cpp", "rust", "go", "python", "make", "cmake", "toml", "markdown", "bash"},
  
    highlight = {
      -- `false` will disable the whole extension
      enable = true,
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },

    -- enable incremental selection
    incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<CR>',
          node_incremental = '<CR>',
          node_decremental = '<BS>',
          scope_incremental = '<TAB>',
        }
      },

    -- NOTE: This is an experimental feature
    indent = {
    enable = true
    }
  }