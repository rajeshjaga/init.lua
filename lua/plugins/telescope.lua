return {
    'nvim-telescope/telescope.nvim',
    event = "VimEnter",
    tag = '0.1.5',
    dependencies = {
        { 'nvim-telescope/telescope-ui-select.nvim' },
        {
            'nvim-tree/nvim-web-devicons',
            enabled = vim.g.have_nerd_font
        },
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-fzf-native.nvim'
    },
    config = function()
        local builtin = require('telescope.builtin')
        require('telescope').setup {
            defaults = {
                file_ignore_patterns = { "node_modules", ".git" },
            },
            extensions = {
                fzf = {},
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                }
            },
        }
        pcall(require('telescope').load_extension, 'ui-select')
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require("telescope").load_extension, "scope")


        vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = "List all [b]uffer" })
        vim.keymap.set('n', '<leader>tD', builtin.lsp_type_definitions, { desc = "List [t]ype [d]efinitions" })
        vim.keymap.set('n', '<leader>tg', builtin.live_grep, { desc = "Live [G]rep from files" })
        vim.keymap.set('n', '<leader>ta', builtin.autocommands, { desc = "List all [a]utocommands" })
        vim.keymap.set('n', '<leader>to', builtin.oldfiles, { desc = " List [o]ld files" })
        vim.keymap.set('n', '<leader>tc', builtin.commands, { desc = "List [c]ommands" })
        vim.keymap.set('n', '<leader>tq', builtin.quickfix, { desc = "List [q]uickfix" })
        vim.keymap.set('n', '<leader>tr', builtin.registers, { desc = "List [r]egisters" })
        vim.keymap.set('n', '<leader>tt', builtin.builtin, { desc = "List [t]elescope" })
        vim.keymap.set('n', '<leader>td', builtin.diagnostics, { desc = "List [d]iagnostics" })
        vim.keymap.set('n', '<leader>ts', builtin.spell_suggest, { desc = "List [s]pell suggest" })
        vim.keymap.set('n', '<leader>tC', builtin.colorscheme, { desc = "List [c]olor[s]chemes" })
        vim.keymap.set('n', '<leader>tF', builtin.filetypes, { desc = "List [f]ile[t]ypes" })
        vim.keymap.set('n', '<leader><Tab>', "<cmd>Telescope scope buffers<cr>", { desc = "List Active Buffers" })

        vim.keymap.set('n', '<leader>nv', function()
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = "Edit Neovim config files" }
        )
        vim.keymap.set('n', "<leader>tf", function()
            local opts = require('telescope.themes').get_dropdown({})
            require('telescope.builtin').find_files(opts)
        end, { desc = "Find Files" }
        )
        vim.keymap.set('n', "<leader>ff", function()
                local opts = require('telescope.themes').get_ivy({
                    cwd = 'C:/Users/Rajesh/code/'
                })
                require('telescope.builtin').find_files(opts)
            end,
            { desc = "Find Files in code folder" })
        require "config.telescope.multigrep".setup()
    end
}
