local M = {}

function M.get_icon(kind, padding)
    local icon = require('aiden.utils.icons')[kind]
    return icon and icon .. string.rep(" ", padding or 0) or ""
end

return M
