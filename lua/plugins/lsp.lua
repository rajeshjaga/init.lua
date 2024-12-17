return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/lazydev.nvim",
            ft = "lua",
            opts = {
                library = {
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
        config = function()
            require 'lspconfig'.lua_ls.setup {
                settings = {
                    Lua = {
                        completion = {
                            callSnipet = 'Replace',
                        }
                    }
                }
            }
            require 'lspconfig'.ts_ls.setup {}
            require 'lspconfig'.gopls.setup {
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
                    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
                    map("<leader>gD", vim.lsp.buf.declaration, "[g]oto [D]eclaration")
                    map("<leader>gd", builtins.lsp_definitions, "[g]oto [d]efinitions")
                    map("<leader>i", builtins.lsp_implementations, "[i]mplement lsp suggestion")
                end
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
