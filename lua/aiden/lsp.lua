local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

local config = require('lspconfig')
config.lua_ls.setup(lsp.nvim_lua_ls({
    on_attach = function(client, bufnr)
        require('nvim-navic').attach(client, bufnr)
    end,
}))

config.rust_analyzer.setup({
    on_attach = function(client, bufnr)
        require('nvim-navic').attach(client, bufnr)
    end,
})

lsp.setup()

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-Space>'] = cmp.mapping.complete(),
})

cmp.setup({
    mapping = cmp_mappings
})

