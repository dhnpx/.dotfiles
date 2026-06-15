vim.pack.add({
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/igorlfs/nvim-dap-view",
	"https://github.com/jay-babu/mason-nvim-dap.nvim",
})

local dap = require("dap")
local dapview = require("dap-view")

dapview.setup({})

vim.keymap.set("n", "<F5>", function()
	dap.continue()
end)
vim.keymap.set("n", "<F1>", function()
	dap.step_into()
end)
vim.keymap.set("n", "<F2>", function()
	dap.step_over()
end)
vim.keymap.set("n", "<F3>", function()
	dap.step_out()
end)
vim.keymap.set("n", "<leader>b", function()
	dap.toggle_breakpoint()
end)
vim.keymap.set("n", "<leader>B", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end)
vim.keymap.set("n", "<F7>", function()
	dapview.toggle()
end)
