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
                    theme = 'tokyonight',
                    icons_enabled = true,
                    component_separators = { left = '󰿟', right = '' },
                    section_separators = { left = '', right = '' },
                },
            }
        end
    },
    {
        "folke/twilight.nvim",
        opts = {
            dimming = {
                alpha = 0.25,        -- amount of dimming
                color = { "Normal", "#ffffff" },
                term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
                inactive = false,    -- when true, other windows will be fully dimmed (unless they contain the same buffer)
            },
            context = 10,            -- amount of lines we will try to show around the current line
            treesitter = true,       -- use treesitter when available for the filetype
            expand = {
                "function",
                "method",
                "table",
                "if_statement",
            },
            exclude = {}, -- exclude these filetypes
        },
        config = function()
            require 'twilight'.setup {
                vim.keymap.set('n', '<leader>t', ':Twilight<CR>', {})
            }
        end,
    },
    {
        "tiagovla/scope.nvim",
        config = function()
            vim.opt.sessionoptions = {
                'buffers',
                'tabpages',
                'globals',
            }
            require('scope').setup({})
        end
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        config = function()
            require 'tokyonight'.setup {
                styles = {
                    comments = { italic = false },
                },
            }
            -- vim.cmd.colorscheme 'tokyonight-night'
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
