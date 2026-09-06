vim.pack.add({
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/neovim/nvim-lspconfig",
})

local fzf = require("fzf-lua")

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		local opts = { buffer = event.buf }

		if client and client:supports_method("textDocument/inlayHint", event.buf) then
			vim.keymap.set("n", "<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, { buffer = event.buf, desc = "Toggle Inlay Hints" })
		end
		vim.keymap.set("n", "grr", fzf.lsp_references, opts)
		vim.keymap.set("n", "gri", fzf.lsp_implementations, opts)
		vim.keymap.set("n", "grd", fzf.lsp_definitions, opts)
		vim.keymap.set("n", "gO", fzf.lsp_document_symbols, opts)
		vim.keymap.set("n", "gW", fzf.lsp_workspace_symbols, opts)
		vim.keymap.set("n", "grt", fzf.lsp_typedefs, opts)
		vim.keymap.set("n", "grD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "grn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "x" }, "gra", vim.lsp.buf.code_action, opts)
		vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	end,
})

---@type table<string, vim.lsp.Config>
local servers = {
	clangd = require("lsp.clangd"),
	gopls = require("lsp.gopls"),
	lua_ls = require("lsp.lua_ls"),
	zls = require("lsp.zls"),
	ts_ls = require("lsp.ts_ls"),
}

require("mason").setup({})

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
	"stylua",
})

require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

for name, server in pairs(servers) do
	vim.lsp.config(name, server)
	vim.lsp.enable(name)
end
