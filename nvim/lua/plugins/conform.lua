vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })

require('conform').setup({
    notify_on_error = false,
    format_on_save = {
        timeout_ms = 3000,
        lsp_format = 'fallback',
    },
    formatters_by_ft = {
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        lua = { 'stylua' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
    },
    formatters = {
        ['clang-format'] = {
            prepend_args = { '-style=file', '-fallback-style=LLVM' },
        },
    },
})
