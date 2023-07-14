local M = {}

function M.get_icon(kind, padding)
    local icon = require('aiden.utils.icons')[kind]
    return icon and icon .. string.rep(" ", padding or 0) or ""
end

function M.set_color(color)
    local c = color or 'catppuccin-mocha'

    vim.cmd.color(c)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return M
