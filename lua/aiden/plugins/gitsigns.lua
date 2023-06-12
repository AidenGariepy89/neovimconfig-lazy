return {
    'lewis6991/gitsigns.nvim',
    tag = 'release',
    config = function()
        require('gitsigns').setup()

        vim.keymap.set('n', '<leader>gb', require('gitsigns').toggle_current_line_blame)
    end,
}

