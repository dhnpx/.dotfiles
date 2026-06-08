return {
	{ -- You can easily change to a different colorscheme.
		-- Change the name of the colorscheme plugin below, and then
		-- change the command in the config to whatever the name of that colorscheme is.
		--
		-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000, -- Make sure to load this before all the other start plugins.
		init = function()
			-- Load the colorscheme here.
			-- Like many other themes, this one has different styles, and you could load
			-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
			require("cyberdream").setup({
				-- Set light or dark variant
				variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`

				-- Enable transparent background
				transparent = true,

				-- Reduce the overall saturation of colours for a more muted look
				saturation = 1, -- accepts a value between 0 and 1. 0 will be fully desaturated (greyscale) and 1 will be the full color (default)

				-- Enable italics comments
				italic_comments = true,

				-- Replace all fillchars with ' ' for the ultimate clean look
				hide_fillchars = false,

				-- Apply a modern borderless look to pickers like Telescope, Snacks Picker & Fzf-Lua
				borderless_pickers = false,

				-- Set terminal colors used in `:terminal`
				terminal_colors = true,

				-- Improve start up time by caching highlights. Generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache
				cache = true,

				-- Override highlight groups with your own colour values
				highlights = {
					-- Highlight groups to override, adding new groups is also possible
					-- See `:h highlight-groups` for a list of highlight groups or run `:hi` to see all groups and their current values

					-- Example:
					--Comment = { fg = "#696969", bg = "NONE", italic = true },

					-- More examples can be found in `lua/cyberdream/extensions/*.lua`
				},

				colors = {
					bg = "#282c34",
					bg_alt = "#1d1f21",
					bg_highlight = "#666666",
					fg = "#ffffff",
					grey = "#c5c8c6",
					blue = "#81a2be",
					green = "#97d89d",
					cyan = "#70c0b1",
					red = "#d54e53",
					yellow = "#f0c674",
					magenta = "#C03f9b",
					pink = "#cc6666",
					orange = "#f0c674",
					purple = "#ad75c8",
				},
				extensions = {},
			})
			vim.cmd.colorscheme("cyberdream")

			-- You can configure highlights by doing something like:
			--vim.cmd.hi("Comment gui=none")
			--vim.cmd.hi("MiniStatuslineModeNormal guifg=#ffffff guibg=#1c00ff00")
		end,
	},
}
