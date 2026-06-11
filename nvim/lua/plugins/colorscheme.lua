vim.pack.add({ "https://github.com/nvim-mini/mini.base16" })

require("mini.base16").setup({
	palette = {
		base00 = "#1d1f21", -- background (yours)
		base01 = "#282a2e", -- lighter background (yours)
		base02 = "#373b41", -- selection (yours)
		base03 = "#7b8496", -- comments (cyberdream)
		base04 = "#a0a8b8", -- dark foreground (cyberdream)
		base05 = "#c5c8c6", -- foreground (yours)
		base06 = "#e0e0e0", -- light foreground (yours)
		base07 = "#eaeaea", -- light background (yours)
		base08 = "#cc6666", -- red (yours)
		base09 = "#d4964e", -- orange (cyberdream toned)
		base0A = "#c4c84e", -- yellow (cyberdream toned)
		base0B = "#7bc47c", -- green (cyberdream toned)
		base0C = "#70c0b1", -- cyan (yours)
		base0D = "#6a9ee0", -- blue (cyberdream toned)
		base0E = "#c397d8", -- purple (yours)
		base0F = "#d44e88", -- pink (cyberdream toned)
	},
})
