Installation
------------

Using lazy

Minimal options
```lua
{
    {
        "Chayanon-Ninyawee/norminette42.nvim",
        opts = {
            user = "username", -- your 42 username
            mail = "your@mail.com", -- your 42 email
            -- add other options.
        },
    },
}
```

Full options
```lua
{
    {
        "Chayanon-Ninyawee/remote-lsp.nvim",
        opts = {
            -- Norminetter Header
            length = 80,
            margin = 5,
            auto_update = true,
            user = "username", -- your 42 username
            mail = "your@mail.com", -- your 42 email
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

            -- Norminette Formatter
            formatOnSave = true,
            formatter = "c_formatter_42",
            filetypes = { c = true, h = true, cpp = true, hpp = true },
        },
    },
}
```
