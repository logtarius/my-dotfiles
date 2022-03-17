-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions

-- vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
-- vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)


local nvim_lsp = require("lspconfig")
local lsp_installer = require("nvim-lsp-installer")


-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    
    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
  
    -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'clangd' }
for _, lsp in pairs(servers) do
    nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end


-- local enhance_server_opts = {
--   ["clangd"] = function(opts)
-- 		opts.args = {
-- 			"--background-index",
-- 			"-std=c++20",
-- 			"--pch-storage=memory",
-- 			"--clang-tidy",
-- 			"--suggest-missing-includes",
-- 		}
-- 		opts.capabilities.offsetEncoding = { "utf-16" }
-- 		opts.single_file_support = true
-- 		opts.commands = {
-- 			ClangdSwitchSourceHeader = {
-- 				function()
-- 					switch_source_header_splitcmd(0, "edit")
-- 				end,
-- 				description = "Open source/header in current buffer",
-- 			},
-- 			ClangdSwitchSourceHeaderVSplit = {
-- 				function()
-- 					switch_source_header_splitcmd(0, "vsplit")
-- 				end,
-- 				description = "Open source/header in a new vsplit",
-- 			},
-- 			ClangdSwitchSourceHeaderSplit = {
-- 				function()
-- 					switch_source_header_splitcmd(0, "split")
-- 				end,
-- 				description = "Open source/header in a new split",
-- 			},
-- 		}
-- 	end
-- }


-- lsp_installer.on_server_ready(function(server)
-- 	local opts = {
-- 		capabilities = capabilities,
-- 		flags = { debounce_text_changes = 150 },
-- 		on_attach = on_attach,
-- 	}

-- 	if enhance_server_opts[server.name] then
-- 		enhance_server_opts[server.name](opts)
-- 	end

-- 	server:setup(opts)
-- end)