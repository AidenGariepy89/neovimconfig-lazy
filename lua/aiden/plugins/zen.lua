return {
    'Pocco81/true-zen.nvim',
    config = function()
        vim.keymap.set('n', '<leader>zm', require('true-zen').minimalist)
        vim.keymap.set('n', '<leader>zf', require('true-zen').ataraxis)
    end,
}
