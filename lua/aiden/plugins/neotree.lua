return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    config = function()
        local manager = require('aiden.manager')

        vim.keymap.set('n', '<leader>e', manager.toggle_neotree)
        vim.keymap.set('n', '<leader>pv', manager.toggle_neotree)
        vim.keymap.set('n', '<leader>o', function()
            if vim.bo.filetype == "neo-tree" then
                vim.cmd.wincmd "p"
            else
                vim.cmd.Neotree "focus"
            end
        end)

        require('neo-tree').setup({
            window = {
                width = 30,
                mappings = {
                    ["l"] = "child_or_open", -- ["l"] = "open",
                    ["h"] = "parent_or_close", -- ["h"] = "close_node",
                }
            },
            commands = {
                parent_or_close = function(state)
                    local node = state.tree:get_node()
                    if (node.type == "directory" or node:has_children()) and node:is_expanded() then
                        state.commands.toggle_node(state)
                    else
                        require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
                    end
                end,
                child_or_open = function(state)
                    local node = state.tree:get_node()
                    if node.type == "directory" or node:has_children() then
                        if not node:is_expanded() then
                            state.commands.toggle_node(state)
                        else
                            require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
                        end
                    else
                        state.commands.open(state)
                    end
                end,
            }
        })
    end,
}
