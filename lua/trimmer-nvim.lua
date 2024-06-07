
local autogroup = vim.api.nvim_create_augroup("trimmer", {clear = true})

local trimmer_enabled = true

local function trim()
    -- Save cursor position
    local cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd([[keeppatterns %s/\s\+$//e]])
    vim.api.nvim_win_set_cursor(0, cursor)
end

local function setup()

    vim.api.nvim_create_autocmd({"BufWritePre"}, {
        group = autogroup,
        desc = "Trim whitespaces before writing buffer to file",
        callback = function (_)
            if trimmer_enabled then
                trim()
            end
        end
    })

    vim.api.nvim_create_user_command(
        "TrimmerToggle",
        function (_)
            trimmer_enabled = not trimmer_enabled
            if trimmer_enabled then
                vim.notify.notify("Trimmer Enabled")
            else
                vim.notify.notify("Trimmer Disabled")
            end
        end,
        {}
    )

end

return { setup = setup }
