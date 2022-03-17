local load_config = function()
	require("plugin-config.lualine")
	require("plugin-config.treesitter")
  require("plugin-config.lsp")
  require("plugin-config.lsp-cmp")
  require("plugin-config.cat-theme")
end

load_config()

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
	'nvim-treesitter/nvim-treesitter',
	run = ':TSUpdate'
  }

  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }

  use {
  -- nvim-cmp
  'hrsh7th/cmp-nvim-lsp', -- { name = nvim_lsp }
  'hrsh7th/cmp-buffer',   -- { name = 'buffer' },
  'hrsh7th/cmp-path',     -- { name = 'path' }
  'hrsh7th/cmp-cmdline',  -- { name = 'cmdline' }
  'hrsh7th/nvim-cmp',
  -- vsnip
  'hrsh7th/cmp-vsnip',    -- { name = 'vsnip' }
  'hrsh7th/vim-vsnip',
  'rafamadriz/friendly-snippets',
  -- lspkind
  'onsails/lspkind-nvim'
  }

  use{
    "catppuccin/nvim",
    as = "catppuccin"
  }
  use{
    "sainnhe/edge",
    as = "edge"
  }
end)