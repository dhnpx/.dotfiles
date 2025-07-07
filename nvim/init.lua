vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.cmd.set("termguicolors")

vim.opt.mouse = "a"
vim.opt.showmode = false

-- Make relative linenumbers default
vim.opt.relativenumber = true
vim.opt.number = true

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case insenstive searching unless /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumon on by default
vim.opt.signcolumn = "yes"

-- Decrease https://aka.sainnhe.dev/fontsupdate time
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`

-- Preview substitutions live, as you type!
--vim.opt.inccommand = "split"

-- Show chich line your cursor is on
vim.opt.cursorline = true

-- Set tab spacing
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Set smart indent
vim.opt.smartindent = true
--vim.opt.autoindent = true

-- Sync OS and Vim clipboard
vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 10

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.signcolumn = "yes"
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.confirm = true

--vim.opt.colorcolumn = "80"

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.diagnostic.config({
	float = {
		focusable = false,
		style = "minmal",
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
	},
})

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Diagnositc keymaps
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic [E]rror message" })
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic[Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with easier shortcut
vim.keymap.set("t", "<Esc><Esc", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Reamp for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set("n", "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- [[ Basic Autocommands ]]

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.filetype.add({
	extension = {
		h = "c",
	},
})
-- [[Install "lazy.nvim" plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable", -- latest stable release
		lazyrepo,
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [Configure and install plugins ]]
require("lazy").setup({

	-- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).

	-- NOTE: Plugins can also be added by using a table,
	-- with the first argument being the link and the following
	-- keys can be used to configure plugin behavior/loading/etc.
	--
	-- Use `opts = {}` to force a plugin to be loaded.
	--
	--  This is equivalent to:
	--    require('Comment').setup({})

	-- NOTE: Plugins can also be configured to run Lua code when they are loaded.
	--
	-- This is often very useful to both group configuration, as well as handle
	-- lazy loading plugins that don't need to be loaded immediately at startup.
	--
	-- For example, in the following configuration, we use:
	--  event = 'VimEnter'
	--
	-- which loads which-key before all the UI elements are loaded. Events can be
	-- normal autocommands events (`:help autocmd-events`).
	--
	-- Then, because we use the `config` key, the configuration only runs
	-- after the plugin has been loaded:
	--  config = function() ... end
	--
	-- NOTE: Plugins can specify dependencies.
	--
	-- The dependencies are proper plugin specifications as well - anything
	-- you do for a plugin at the top level, you can do for a dependency.
	--
	-- Use the `dependencies` key to specify the dependencies of a particular plugin

	require("plugins.which-key"),
	require("plugins.snacks"),
	require("plugins.lsp"),
	require("plugins.nvim-tresitter"),
	require("plugins.nvim-treesitter-context"),
	require("plugins.blink"),
	require("plugins.lazydev"),
	require("plugins.luvit-meta"),
	require("plugins.debug"),
	require("plugins.trouble"),
	require("plugins.mini"),
	require("plugins.vim-fugitive"),
	require("plugins.gitsigns"),
	require("plugins.undotree"),
	require("plugins.oil"),
	require("plugins.yazi"),
	require("plugins.conform"),
	require("plugins.vim-sleuth"),
	require("plugins.todo-comments"),
	require("plugins.comment"),
	require("plugins.lint"),
	require("plugins.java"),
	require("plugins.peek"),
	require("plugins.cyberdream"), --colorscheme
	require("plugins.colorizer"),

	--require("plugins.onehalf"),
	--require("custom.plugins.neo-tree"),
	--require("plugins.nvim-cmp"),
	--require("plugins.telescope"),
	--require("plugins.indent_line"),

	-- { import = 'plugins' },
})
