return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
        vim.keymap.set('n', '<leader>gl', '<cmd>Git log --oneline<cr>')
        vim.keymap.set('n', '<leader>gf', '<cmd>Git fetch<cr>')
    end,
}
