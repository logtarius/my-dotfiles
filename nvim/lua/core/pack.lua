local load_config = function()
	require("plugin-config.lualine")
	require("plugin-config.treesitter")
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
end)