return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    init = function() vim.g.neo_tree_remove_legacy_commands = true end,
    config = function()
        -- vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<cr>')
        vim.keymap.set('n', '<leader>e', '<cmd>Neotree reveal float<cr>')
        vim.keymap.set('n', '<leader>o', function()
            if vim.bo.filetype == "neo-tree" then
                vim.cmd.wincmd "p"
            else
                vim.cmd.Neotree "focus"
            end
        end)

        local get_icon = require('aiden.utils').get_icon

        require('neo-tree').setup({
            close_if_last_window = true,
            auto_clean_after_session_restore = true,
            sources = { "filesystem", "buffers", "git_status" },
            source_selector = {
                winbar = true,
                content_layout = "center",
                sources = {
                    { source = "filesystem",  display_name = get_icon("FolderClosed", 1) .. "File" },
                    { source = "buffers",     display_name = get_icon("DefaultFile", 1) .. "Bufs" },
                    { source = "git_status",  display_name = get_icon("Git", 1) .. "Git" },
                    { source = "diagnostics", display_name = get_icon("Diagnostic", 1) .. "Diagnostic" },
                },
            },
            default_component_configs = {
                indent = { padding = 0, indent_size = 1 },
                icon = {
                    folder_closed = get_icon "FolderClosed",
                    folder_open = get_icon "FolderOpen",
                    folder_empty = get_icon "FolderEmpty",
                    folder_empty_open = get_icon "FolderEmpty",
                    default = get_icon "DefaultFile",
                },
                modified = { symbol = get_icon "FileModified" },
                git_status = {
                    symbols = {
                        added = get_icon "GitAdd",
                        deleted = get_icon "GitDelete",
                        modified = get_icon "GitChange",
                        renamed = get_icon "GitRenamed",
                        untracked = get_icon "GitUntracked",
                        ignored = get_icon "GitIgnored",
                        unstaged = get_icon "GitUnstaged",
                        staged = get_icon "GitStaged",
                        conflict = get_icon "GitConflict",
                    },
                },
            },
            window = {
                width = 30,
                mappings = {
                    ["l"] = "child_or_open",   -- ["l"] = "open",
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
            },
            filesystem = {
                follow_current_file = true,
                hijack_netrw_behavior = "open_current",
            },
            event_handlers = {
                {
                    event = "neo_tree_buffer_enter",
                    handler = function(_) vim.opt_local.signcolumn = "auto" end,
                },
            },
        })
    end,
}
