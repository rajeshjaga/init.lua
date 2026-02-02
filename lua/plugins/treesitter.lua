return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require"nvim-treesitter".setup {
              install_dir = vim.fn.stdpath('data') .. '/site'
        }
        require"nvim-treesitter".install{'rust','lua','vim','vimdoc', 'bash'}
    end
}

