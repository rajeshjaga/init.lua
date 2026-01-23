return {
    'folke/which-key.nvim',
    event = "VimEnter",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
        require('which-key').setup({})
    end
}
