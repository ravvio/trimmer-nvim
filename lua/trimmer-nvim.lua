local M = {}

local autogroup = vim.api.nvim_create_augroup("trimmer", {clear = true})

M.trimmer_enabled = true

M.trim = function ()
    -- Save cursor position
    local cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, cursor)
end

M.setup = function ( opts )

    if opts.enabled == false then
        M.trimmer_enabled = false
    end

    local events = {"BufWritePre"}
    if opts.events then
        events = opts.events
    end

    vim.api.nvim_create_autocmd(events, {
        group = autogroup,
        desc = "Trim whitespaces before writing buffer to file",
        callback = function (_)
            if M.trimmer_enabled then
                M.trim()
            end
        end
    })

    vim.api.nvim_create_user_command(
        "TrimmerTrim",
        function (_)
            M.trim()
        end,
        {}
    )

    vim.api.nvim_create_user_command(
        "TrimmerToggle",
        function (_)
            M.trimmer_enabled = not M.trimmer_enabled
            if M.trimmer_enabled then
                vim.notify.notify("Trimmer Enabled")
            else
                vim.notify.notify("Trimmer Disabled")
            end
        end,
        {}
    )

end

return M
