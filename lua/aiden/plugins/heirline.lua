return {
    'rebelot/heirline.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        {
            'SmiteshP/nvim-navic',
            dependencies = 'neovim/nvim-lspconfig',
            config = function()
                require('aiden.navic')
            end,
        },
    },
    config = function()
        require('aiden.heirline')
    end,
}

