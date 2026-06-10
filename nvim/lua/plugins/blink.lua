vim.pack.add({
    'https://github.com/saghen/blink.lib',
    'https://github.com/saghen/blink.cmp'
})

local cmp = require('blink.cmp')
cmp.build():pwait()
cmp.setup({
    sources = {
        default = { 'path', 'buffer' },
    },
    fuzzy = { implementation = 'prefer_rust_with_warning' }
})
