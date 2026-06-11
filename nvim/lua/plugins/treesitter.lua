vim.pack.add({ "https://github.com/romus204/tree-sitter-manager.nvim" })

local tsm = require("tree-sitter-manager")

tsm.setup({
	ensure_installed = { "html", "zig", "zsh", "bash", "lua", "c", "vim", "vimdoc" },
	auto_install = true,
	highlight = true,
})

vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
	group = vim.api.nvim_create_augroup("TreesitterAttach", { clear = true }),
	callback = function()
		if vim.bo.buftype ~= "" then
			return
		end
		pcall(vim.treesitter.start, 0)
	end,
})
