return {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    cmd = { 'ConformInfo' },
    keys = {
        {
            '<leader>f',
            function()
                require 'conform'.format { async = true, lsp_format = true }
            end,
            mode = '',
            desc = '[F]ormat Buffer',

        }
    }
}
