vim.pack.add({'https://github.com/romus204/tree-sitter-manager.nvim'})

local tsm = require('tree-sitter-manager')

tsm.setup({
    ensure_installed = { 'html', 'zig', 'zsh', 'bash', 'lua', 'c' },
    auto_install = true,
})

vim.api.nvim_create_autocmd('FileType', {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

