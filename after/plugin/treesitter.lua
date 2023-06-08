require('nvim-treesitter.configs').setup({
    ensure_installed = { "rust", "lua", "c", "cpp", "javascript" },
    auto_install = true,
    highlight = {
        enable = true,
    }
})

