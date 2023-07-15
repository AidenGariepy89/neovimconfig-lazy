return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.concealer"] = {
                    config = {
                        icon_preset = "diamond",
                    },
                }, -- Adds pretty icons to your documents
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/notes/main",
                            college2023 = "~/notes/college2023",
                        },
                        default_workspace = "notes",
                    },
                },
            },
        }
        vim.keymap.set('n', '<localleader>1', function()
            vim.cmd("Neorg workspace")
            vim.cmd("Neorg index")
        end)
        vim.keymap.set('n', '<localleader>2', function()
            vim.cmd("Neorg workspace college2023")
            vim.cmd("Neorg index")
        end)
    end,
}
