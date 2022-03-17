
local vim = vim


local leader_map = function()
	vim.g.mapleader = ","
	vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
	vim.api.nvim_set_keymap("x", " ", "", { noremap = true })
end


-- egde theme
function config_edge()
	vim.cmd([[set background=light]])
	vim.g.edge_style = "aura"
	vim.g.edge_enable_italic = 1
	vim.g.edge_disable_italic_comment = 1
	vim.g.edge_show_eob = 1
	vim.g.edge_better_performance = 1
	vim.g.edge_transparent_background = 1
end


local load_core = function()

	leader_map()


	require("core.options")
	require("core.mapping")
	require("core.pack")
	config_edge()
	vim.cmd([[colorscheme edge]])
	-- vim.cmd([[colorscheme catppuccin]])
end

load_core()
