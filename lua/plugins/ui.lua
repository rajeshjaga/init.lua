return {
    { 'echasnovski/mini.nvim',   version = "*" },
    { "akinsho/bufferline.nvim", opts = { options = { separator_style = "slope" } } },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require 'rose-pine'.setup({
                variant = "main",
                styles = {
                    bold = true,
                    italic = true,
                    transparency = true
                }
            })
            vim.cmd("colorscheme rose-pine")
        end
    },
    {
        "sphamba/smear-cursor.nvim",
        opts = {}
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {},
        config = function()
            require('ibl').setup()
        end
    },
    {
        'folke/which-key.nvim',
        event = "VimEnter",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 500
            require('which-key').setup({})
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup {
                options = {
                    --- @usage 'rose-pine'
                    theme = 'rose-pine',
                    icons_enabled = true,
                    component_separators = { left = '󰿟', right = '' },
                    section_separators = { left = '', right = '' },
                },
            }
        end
    },
    "folke/twilight.nvim",
    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        opts = {
            window = { backdrop = 0.7 },
            plugins = {
                gitsigns = true,
                tmux = true,
                kitty = { enabled = false, font = "+2" },
            }
        },
        keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
    },
    {
        "tiagovla/scope.nvim",
        config = function()
            require("scope").setup({})
            vim.opt.sessionoptions = { -- required
                "buffers",
                "tabpages",
                "globals",
            }
        end
    },
    {
        'stevearc/dressing.nvim',
        opts = {},
        config = function()
            require("dressing").setup({
                input = {
                    win_options = {
                        winhighlight = 'NormalFloat:DiagnoticError'
                    }
                }
            }
            )
        end
    },
}
