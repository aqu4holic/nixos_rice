local autocmd = vim.api.nvim_create_autocmd

-- Ibus typing
local ibus_cur = "BambooUs"
local ibus_en = "BambooUs"

autocmd("InsertEnter", {
    pattern = { "*" },
    callback = function()
        os.execute("ibus engine " .. ibus_cur)
    end,
})

autocmd("InsertLeave", {
    pattern = { "*" },
    callback = function()
        local f = io.popen("ibus engine", "r")
        if f then
            ibus_cur = f:read("*a")
            f:close()
        end
        os.execute("ibus engine " .. ibus_en)
    end,
})

---@param padding_amount integer
---@param margin_amount integer
local set_spacing = function(padding_amount, margin_amount)
    -- locar command = string.format('kitty @ set-spacing padding=%d margin=%d', padding_amount, margin_amount)
    vim.fn.system({
        "kitty",
        "@",
        "set-spacing",
        "padding=" .. padding_amount,
        "margin=" .. margin_amount,
    })
end

set_spacing(0, 0)

autocmd("VimLeave", {
    once = true,
    callback = function()
        set_spacing(0, 20)
    end,
})

-- auto reload buffer when changed
autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    callback = function()
        if vim.api.nvim_get_mode() ~= "c" then
            vim.cmd("checktime")
        end
    end,
})

autocmd("FileChangedShellPost", {
    callback = function()
        vim.cmd(([[echohl WarningMsg | echomsg "%s" | echohl None]]):format("File changed on disk. Buffer reloaded."))
    end,
})

-- trim trailing whitespace
autocmd({ "BufWritePre", "InsertLeave", "BufWritePost" }, {
    pattern = {"*"},
    callback = function(ev)
        save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

-- autosave
local function clear_cmdarea()
    vim.defer_fn(function()
        vim.api.nvim_echo({}, false, {})
    end, 800)
end

autocmd({ "InsertLeave", "TextChanged" }, {
    callback = function()
        if #vim.api.nvim_buf_get_name(0) ~= 0 and vim.bo.buflisted then
            vim.cmd "silent w"

            local time = os.date "%I:%M %p"

            -- print nice colored msg
            vim.api.nvim_echo({ { "󰄳", "LazyProgressDone" }, { " file autosaved at " .. time } }, false, {})

            clear_cmdarea()
        end
    end,
})