local pickers = require("telescope.pickers")
local finder = require("telescope.finders")

local m = {}

local live_multigrep = function(opts)
    opts = opts or {}
    opts.cwd = opts.cwed or vim.uv.cwd()

    finder.new_sync_job {
        command_generator = function(prompt)
            if not prompt or prompt == "" then
                return nil
            end

            local pieces = vim.split(prompt, "  ")
            local args = { "rg" }
            if pieces[1] then
                table.insert(args, "-e")
                table.insert(args, pieces[1])
            end
            if pieces[2] then
                table.insert(args, "-g")
                table.insert(args, pieces[2])
            end
            ---@diagnostic disable-next-line: deprecated
            return vim.tbl_flatten {
                args,
                { "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
            }
        end
    }
    pickers.new(opts, {
        finder = finder,

    }):find()
end

m.setup = function()
    live_multigrep()
end

return m
