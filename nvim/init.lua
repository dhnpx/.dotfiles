vim.loader.enable()
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = false

vim.o.number = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.expandtab = true

vim.o.showmode = false

vim.o.breakindent = true

vim.o.wrap = false

vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.signcolumn = "yes"

vim.o.updatetime = 50

vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.inccommand = "split"

vim.o.cursorline = true

--vim.o.list = true
--vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.o.scrolloff = 10

vim.opt.isfname:append("@-@")
vim.opt.termguicolors = true

vim.o.confirm = true

vim.o.winborder = "single"

vim.o.hlsearch = false
vim.o.incsearch = true

vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severeity = { min = vim.diagnostic.severity.WARN } },
	virtual_text = true,
	virtual_lines = false,
})

vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y"')
vim.keymap.set("n", "<leader>Y", '"+Y"')
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P')

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
	callback = function()
		vim.hl.on_yank({ timeout = 40 })
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Strip trailing whitespace before saving",
	group = vim.api.nvim_create_augroup("StripTrailingWhitespace", { clear = true }),
	callback = function()
		vim.cmd([[%s/\s\+$//e]])
	end,
})

require("plugins.fzf-lua")
require("plugins.oil")
require("plugins.treesitter")
require("plugins.blink")
require("plugins.lsp")
require("plugins.colorscheme")
require("plugins.gitsigns")
require("plugins.conform")
require("plugins.undotree")
require("plugins.trouble")
require("plugins.surround")
require("plugins.ts-textobjects")
