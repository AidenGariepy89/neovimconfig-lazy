return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { "rust", "lua", "c", "cpp", "javascript" },
                auto_install = true,
                highlight = {
                    enable = true,
                }
            })
        end
    },
    'nvim-treesitter/nvim-treesitter-context',
}

