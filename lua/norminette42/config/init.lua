local M = {}

M.opts = {
    -- Norminetter Header
    length = 80,
    margin = 5,
    auto_update = true,
    user = "username",
    mail = "your@mail.com",
    asciiart = {
        "        :::      ::::::::",
        "      :+:      :+:    :+:",
        "    +:+ +:+         +:+  ",
        "  +#+  +:+       +#+     ",
        "+#+#+#+#+#+   +#+        ",
        "     #+#    #+#          ",
        "    ###   ########.fr    ",
    },
    git = {
        enabled = false,
        bin = "git",
        user_global = true,
        email_global = true,
    },

    -- Norminette
    runOnSave = true,
    maxErrorsToShow = 10,
    norminetteArgs = "",

    -- Norminette Formatter
    formatOnSave = true,
    formatter = "c_formatter_42",
    filetypes = { c = true, h = true, cpp = true, hpp = true },
}

---Applies the user options to the default table.
---@param opts table: settings
M.set = function(opts)
    M.opts = vim.tbl_deep_extend("force", M.opts, opts or {})
end

return M
