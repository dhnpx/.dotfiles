return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_markers = { "go.work", "go.mod", ".git" },
	settings = {
		gopls = {
			-- code analysis
			analyses = {
				unusedparams = true, -- warn on unused function params
				unusedvariable = true, -- warn on unused variables
				shadow = true, -- warn on shadowed variables
				nilness = true, -- check for nil dereferences
				useany = true, -- warn on unnecessary use of any
			},

			-- enable staticcheck suite (SA*, S*, ST* checks)
			staticcheck = true,

			-- use gofumpt instead of gofmt (stricter formatting)
			gofumpt = false,

			-- inlay hints
			hints = {
				assignVariableTypes = true, -- i/* int*/ := 0
				compositeLiteralFields = true, -- {/*name:*/ "foo"}
				compositeLiteralTypes = true, -- []/*string*/{"foo"}
				constantValues = true, -- const X = iota/* = 0*/
				functionTypeParameters = true, -- generic type args
				parameterNames = true, -- f(/*n:*/ 1, /*s:*/ "x")
				rangeVariableTypes = true, -- for k/*int*/, v/*string*/
			},

			-- semantic tokens for better syntax highlighting
			semanticTokens = true,

			-- auto-import completions
			usePlaceholders = true,

			-- complete unimported packages
			completeUnimported = true,

			-- show docs in completion
			deepCompletion = true,
		},
	},
}
