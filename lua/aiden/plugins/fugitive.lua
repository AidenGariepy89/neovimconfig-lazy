return {
    'tpope/vim-fugitive',
    config = function()
        vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
        vim.keymap.set('n', '<leader>gl', '<cmd>Git log --oneline<cr>')
        vim.keymap.set('n', '<leader>gf', '<cmd>Git fetch<cr>')

        local Aiden_Fugitive = vim.api.nvim_create_augroup('Aiden_Fugitive', {})

        vim.api.nvim_create_autocmd('BufWinEnter', {
            group = Aiden_Fugitive,
            pattern = '*',
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set('n', '<leader>p', function()
                    vim.cmd.Git('push')
                end, opts)

                vim.keymap.set('n', '<leader>P', function()
                    vim.cmd.Git({'pull', '--rebase'})
                end, opts)

                vim.keymap.set('n', '<leader>t', ':Git push -u origin main', opts)
            end,
        })
    end,
}
