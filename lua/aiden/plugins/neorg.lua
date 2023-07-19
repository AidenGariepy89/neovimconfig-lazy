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
                        icons = {
                            ordered = {
                                icons = (not has_anticonceal) and { "1", "A", "a", "1", "A", "a" } or nil,
                            },
                        },
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
                ["core.keybinds"] = {
                    config = {
                        hook = function(keybinds)
                            keybinds.map("norg", "n", "<localleader>c", "<cmd>Neorg toc qflist<cr>")
                            keybinds.map("norg", "n", "<localleader>C", "<cmd>Neorg toc<cr>")
                            keybinds.map("norg", "n", "<localleader>im", "<cmd>Neorg inject-metadata<cr>")
                        end,
                    },
                },
                ["core.qol.toc"] = {
                    config = {
                        close_after_use = true,
                    },
                },
                ["core.summary"] = {},
            },
        }
        vim.keymap.set('n', '<localleader>1', function()
            vim.cmd("Neorg workspace notes")
            vim.cmd("Neorg index")
        end)
        vim.keymap.set('n', '<localleader>2', function()
            vim.cmd("Neorg workspace college2023")
            vim.cmd("Neorg index")
        end)

        vim.cmd("set conceallevel=2")
    end,
}
