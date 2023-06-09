return {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        vim.keymap.set('n', '<leader>t', vim.cmd.TroubleToggle)
    end,
}
