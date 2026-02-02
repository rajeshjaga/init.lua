return {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
        "saghen/blink.cmp",
    },
    config = function()
        require "mason-lspconfig".setup {
            ensure_installed = { "ts_ls", "pyright", "bashls", "lua_ls" },
            automatic_installation = true
        }

        vim.lsp.enable("ts_ls")
        vim.lsp.enable("bashls")
        vim.lsp.enable("pyright")
        vim.lsp.enable("lua_ls")

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if not client then return end
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                        end
                    })
                end
            end,
        })
    end,
}
