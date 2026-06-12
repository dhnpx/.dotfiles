vim.pack.add({ "https://github.com/tpope/vim-fugitive" })

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("FugitiveConfig", { clear = true }),
	pattern = "fugitive",
	callback = function()
		local opts = { buffer = true, remap = false }

		vim.keymap.set("n", "<leader>gp", function()
			vim.cmd.Git("push")
		end, opts)

		vim.keymap.set("n", "<leader>gP", function()
			vim.cmd.Git({ "pull", "--rebase" })
		end, opts)

		vim.keymap.set("n", "<leader>gt", ":Git push -u origin ", opts)
	end,
})
