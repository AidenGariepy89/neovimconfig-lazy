local M = { }

M.toggle_neotree = function()
    local active = M.is_neotree_active()
    if active == true then
        vim.cmd("Neotree close")
    else
        vim.cmd("Neotree reveal_file=%")
    end
end

M.update_neotree = function()
    local active = M.is_neotree_active()
    if active == true and vim.fn.expand('%') ~= 'neo-tree filesystem [1]' then
        vim.cmd("Neotree show reveal_file=%")
    end
end

M.is_neotree_active = function()
    return require('neo-tree.ui.renderer').tree_is_visible(require('neo-tree.sources.manager').get_state('filesystem'))
end

return M

