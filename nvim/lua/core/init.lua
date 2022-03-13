
local vim = vim


local leader_map = function()
	vim.g.mapleader = ","
	vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
	vim.api.nvim_set_keymap("x", " ", "", { noremap = true })
end



local load_core = function()

	leader_map()


	require("core.options")
	require("core.mapping")
	require("core.pack")
	-- require("keymap")
	-- pack.load_compile()

end

load_core()
