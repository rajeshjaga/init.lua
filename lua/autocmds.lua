vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'High the yanked text',
    group = vim.api.nvim_create_augroup('lucifer', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end
})
