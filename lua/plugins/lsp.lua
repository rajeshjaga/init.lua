return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
        "saghen/blink.cmp",
    },
    config = function()
        require"mason-lspconfig".setup{
            ensure_installed = { "ts_ls", "pyright", "bashls", "lua_ls" },
            automatic_installation = true
        }

        vim.lsp.enable("ts_ls")
        vim.lsp.enable("bashls")
        vim.lsp.enable("pyright")
        vim.lsp.enable("lua_ls")
    end,
}
