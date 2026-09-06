return {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--fallback-style=google",
	},
	filetypes = { "c", "cpp", "objc", "objcpp" },
	root_markers = {
		".clangd",
		"compile_commands.json",
		"compile_flags.txt",
		"build.ninja",
		"CMakeLists.txt",
		"Makefile",
		".git",
	},
	init_options = {
		usePlaceholders = true,
		completeUnimported = true,
		clangdFileStatus = true,
	},
}
