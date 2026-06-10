vim.pack.add({ 'https://github.com/lewis6991/gitsigns.nvim' }

local gs = require('gitsigns')

gs.setup({
    on_attach = function(bufnr)

    -- Navigation
    vim.keymap.set('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        gs.nav_hunk('next')
      end
    end, { buffer = bufnr, desc = 'Next git change' })

    vim.keymap.set('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        gs.nav_hunk('prev')
      end
    end, { buffer = bufnr, desc = 'Prev git change' })

    -- Stage/reset hunks (visual)
    vim.keymap.set('v', '<leader>hs', function()
      gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { buffer = bufnr, desc = 'Stage hunk' })

    vim.keymap.set('v', '<leader>hr', function()
      gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { buffer = bufnr, desc = 'Reset hunk' })

    -- Stage/reset hunks (normal)
    vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { buffer = bufnr, desc = 'Stage hunk' })
    vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { buffer = bufnr, desc = 'Reset hunk' })
    vim.keymap.set('n', '<leader>hS', gs.stage_buffer, { buffer = bufnr, desc = 'Stage buffer' })
    vim.keymap.set('n', '<leader>hR', gs.reset_buffer, { buffer = bufnr, desc = 'Reset buffer' })

    -- Preview
    vim.keymap.set('n', '<leader>hp', gs.preview_hunk, { buffer = bufnr, desc = 'Preview hunk' })
    vim.keymap.set('n', '<leader>hi', gs.preview_hunk_inline, { buffer = bufnr, desc = 'Preview hunk inline' })

    -- Blame
    vim.keymap.set('n', '<leader>hb', function()
      gs.blame_line({ full = true })
    end, { buffer = bufnr, desc = 'Blame line' })

    -- Diff
    vim.keymap.set('n', '<leader>hd', gs.diffthis, { buffer = bufnr, desc = 'Diff against index' })

    -- Toggles
    vim.keymap.set('n', '<leader>tb', gs.toggle_current_line_blame, { buffer = bufnr, desc = 'Toggle blame' })
    vim.keymap.set('n', '<leader>tw', gs.toggle_word_diff, { buffer = bufnr, desc = 'Toggle word diff' })

    -- Text object
    vim.keymap.set({ 'o', 'x' }, 'ih', gs.select_hunk, { buffer = bufnr, desc = 'Select hunk' })
  end,

})
