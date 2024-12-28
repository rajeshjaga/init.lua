return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "saghen/blink.cmp",
            {
                "folke/lazydev.nvim",
                ft = "lua",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },
        config = function()
            local capabilities = require 'blink.cmp'.get_lsp_capabilities()
            require 'lspconfig'.lua_ls.setup { capabilities = capabilities }
            require 'lspconfig'.ts_ls.setup { capabilities = capabilities }
            require 'lspconfig'.gopls.setup {
                capabilities = capabilities,
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                        gofumpt = true,
                    }
                }
            }
            local builtins = require "telescope.builtin"
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup('lsp-buf', { clear = true }),
                callback = function(event)
                    local map = function(key, func, desc)
                        vim.keymap.set("n", key, func, { buffer = event.buf, desc = desc })
                    end
                    -- telescope integrated lsp actions
                    map("<leader>d", builtins.lsp_definitions, "[d]efinitions")
                    map("<leader>i", builtins.lsp_implementations, "[i]mplement lsp suggestion")
                    map("<leader>r", builtins.lsp_references, "[r]eferences lsp")
                    map("<leader>ws", builtins.lsp_workspace_symbols, "[W]orkspaces [S]ymbols")
                    map("<leader>ds", builtins.lsp_document_symbols, "[d]ocument [S]ymbols")
                    map("<leader>td", builtins.lsp_type_definitions, "[t]ype [d]efinitions")
                    -- vim integrated lsp actions
                    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                    map("<leader>D", vim.lsp.buf.declaration, "[D]eclaration")
                    map("<leader>f", vim.lsp.buf.format, "[f]ormat")
                    map("<leader>r", vim.lsp.buf.rename, "[r]ename the variable under cursor")
                    map("K", vim.lsp.buf.hover, "[h]over under cursor")

                    local client = vim.lsp.get_client_by_id(event.data.event_id)
                    if client and client.server_capabilities.documentHighlightProvider then
                        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHold' }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.document_highlight,
                        })
                        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMoved' }, {
                            buffer = event.buf,
                            callback = vim.lsp.buf.clear_references,
                        })
                    end
                end,
            })

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
        end
    }
}
