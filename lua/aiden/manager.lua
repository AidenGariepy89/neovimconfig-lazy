local M = { }

M.toggle_neotree = function()
    local active = M.is_neotree_active()
    if active == true then
        vim.cmd("Neotree close")
    else
        local path = vim.api.nvim_buf_get_name(0)
        local f = io.open(path, "r")
        if f ~= nil then
            io.close(f)
            vim.cmd("Neotree reveal_file=%")
        else
            vim.cmd("Neotree toggle")
        end
    end
end

M.update_neotree = function()
    local active = M.is_neotree_active()
    if active == true then
        local path = vim.api.nvim_buf_get_name(0)
        local f = io.open(path, "r")
        if f ~= nil then
            io.close(f)
            vim.cmd("Neotree show reveal_file=%")
        end
    end
end

M.is_neotree_active = function()
    return require('neo-tree.ui.renderer').tree_is_visible(require('neo-tree.sources.manager').get_state('filesystem'))
end

return M

