vim.pack.add({'https://github.com/nvim-mini/mini.base16'})

require('mini.base16').setup({
    palette = {
        base00 = '#1d1f21', -- background
        base01 = '#282a2e', -- lighter background
        base02 = '#373b41', -- selection
        base03 = '#969896', -- comments
        base04 = '#b4b7b4', -- dark foreground
        base05 = '#c5c8c6', -- foreground
        base06 = '#e0e0e0', -- light foreground
        base07 = '#ffffff', -- light background
        base08 = '#cc6666', -- red
        base09 = '#de935f', -- orange
        base0A = '#f0c674', -- yellow
        base0B = '#b5bd68', -- green
        base0C = '#8abeb7', -- cyan
        base0D = '#81a2be', -- blue
        base0E = '#b294bb', -- purple
        base0F = '#a3685a', -- brown
    },
})
