local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier,
		formatting.black,
		formatting.stylua,
		formatting.gofmt,
		-- diagnostics.flake8,
	},
	autostart = true, -- Ensure this is set to true if you want autostart
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentFormattingProvider then
			vim.api.nvim_command([[augroup Format]])
			vim.api.nvim_command([[autocmd! * <buffer>]])
			vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
			vim.api.nvim_command([[augroup END]])
		end
	end,
})
