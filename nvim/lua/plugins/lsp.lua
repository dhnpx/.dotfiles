vim.pack.add({
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/mason-org/mason-lspconfig.nvim',
    'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim'
})

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
    callback = function(event)
        local client = vim.lsp.get_client_by_id(event.data.client_id)

        if client and client:supports_method('textDocument/inlayHint', event.buf) then
            vim.keymap.set('n', '<leader>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, { buffer = event.buf, desc = 'Toggle Inlay Hints' })
        end
    end,
})

---@type table<string, vim.lsp.Config>
local servers = {
    clangd = {},
    gopls = {},
    pyright = {},
    stylua = {},
    lua_ls = require('lsp.lua_ls'),
    zls = {},
}

require('mason').setup({})

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {

})

require('mason-tool-installer').setup({ ensure_installed = ensure_installed })

for name, server in pairs(servers) do
    vim.lsp.config(name, server)
    vim.lsp.enable(name)
end

