return {
    'eandrju/cellular-automaton.nvim',
    config = function()
        vim.keymap.set('n', '<leader>q', '<cmd>CellularAutomaton make_it_rain<cr>')
    end,
}
