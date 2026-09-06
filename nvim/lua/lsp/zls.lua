return {
	cmd = { "zls" },
	filetypes = { "zig" },
	root_markers = { "build.zig", "build.zig.zon", ".git" },
	settings = {
		zls = {
			enable_inlay_hints = true,
			inlay_hints_show_builtin = true,
			include_at_in_builtins = true,
			warn_style = true,
			enable_autofix = false,
		},
	},
}
