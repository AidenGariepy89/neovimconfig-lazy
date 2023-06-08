local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    'catppuccin/nvim',
    { 'nvim-telescope/telescope.nvim', tag = '0.1.1', dependencies = { { 'nvim-lua/plenary.nvim' } } },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    'nvim-treesitter/nvim-treesitter-context',
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',
    'tpope/vim-commentary',
    { 'lewis6991/gitsigns.nvim', tag = 'release', config = function() require('gitsigns').setup() end },
    { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },
    'Pocco81/true-zen.nvim',
    'rebelot/heirline.nvim',

    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v2.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        }
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    }
}

local opts = {
}

require('lazy').setup(plugins, opts)
