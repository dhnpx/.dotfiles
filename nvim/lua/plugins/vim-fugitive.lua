return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [S]tatus" })
			local bufnr = vim.api.nvim_get_current_buf()
			local opts = { buffer = bufnr, remap = false }
			vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "[G]it [p]ush" })

			-- rebase always
			vim.keymap.set("n", "<leader>gp", ":Git pull --rebase<CR>", { desc = "[G]it [P]ull (rebase)" })

			vim.keymap.set("n", "<leader>gpu", ":Git push -u origin<CR>", opts)

			vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
			vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
		end,
	},
}
