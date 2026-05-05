local M = {}

function M.setup(opts)
    local config = require("norminette42.config")
    local header = require("norminette42.header")
    local norminette = require("norminette42.norminette")
    local formatter = require("norminette42.formatter")

    local custom = vim.api.nvim_create_augroup("custom_header_group", {})

    config.set(opts)
    vim.api.nvim_create_user_command("NorminetteStdheader", header.stdheader, {})

    if config.opts.auto_update == true then
        vim.api.nvim_create_autocmd("BufWritePre", {
            nested = true,
            group = custom,
            callback = function()
                local headerStr = header.gen_header()
                if header.has_header(headerStr) then
                    header.update_header(headerStr)
                end
            end,
        })
    end


    vim.api.nvim_create_user_command('NorminetteDisable', function()
        norminette.NorminetteDisable()
    end, {})
    vim.api.nvim_create_user_command('NorminetteEnable', function()
        norminette.NorminetteEnable(config.opts.maxErrorsToShow)
    end, {})

    local runNorminette = function()
        return norminette.norminette42(config.opts.maxErrorsToShow)
    end

    local runFormatter = function()
        formatter.format()
        vim.cmd("write")
    end
    if config.opts.formatOnSave then
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            pattern = { "*.c", "*.h" },
            callback = runFormatter
        })
    end

    formatter.setup_commands();

    -- Check on buffer enter
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = { "*.c", "*.h" },
        callback = runNorminette
    })

    -- Check on save
    if config.opts.runOnSave then
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            pattern = { "*.c", "*.h" },
            callback = runNorminette
        })
    end
end

return M
