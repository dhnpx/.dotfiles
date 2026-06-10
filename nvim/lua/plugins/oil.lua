vim.pack.add({'https://github.com/stevearc/oil.nvim'})

local oil = require('oil')

oil.setup({})

vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent diretory' })
