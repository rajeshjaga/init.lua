vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'High the yanked text',
    group = vim.api.nvim_create_augroup('lucifer', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
