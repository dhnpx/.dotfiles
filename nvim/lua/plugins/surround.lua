vim.pack.add({ "https://github.com/nvim-mini/mini.surround" })

require("mini.surround").setup({
	mappings = {
		add = "sa",
		delete = "sd",
		replace = "sr",
	},
})
