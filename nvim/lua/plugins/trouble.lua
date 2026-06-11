vim.pack.add({ "https://github.com/folke/trouble.nvim" })

require("trouble").setup({})

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set("n", "<leader>xb", "<cmd>Trouble toggle filger.buf=0<cr>")
vim.keymap.set("n", "<leader>xd", "<cmd>Trouble symbols toggle focus=false<cr>")
vim.keymap.set("n", "[x", function()
	require("trouble").previous({ skip_groups = true, jump = true })
end)
vim.keymap.set("n", "]x", function()
	require("trouble").next({ skip_groups = true, jump = true })
end)
