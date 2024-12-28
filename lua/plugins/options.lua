return {
    { -- colors to show in buffer
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup {}
        end
    },
    {
        "dstein64/vim-startuptime"
    },
    { -- harpoon to mark files for quick access
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } },
        config = function()
            local harpoon = require("harpoon")
            harpoon:setup()

            vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
                { desc = "Harpoon list" })
            vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end, { desc = "Harpoon Mark" })
            -- Toggle previous & next buffers stored within Harpoon list
            vim.keymap.set("n", "<leader>P", function() harpoon:list():prev() end,
                { desc = "Switch to previous file harpoon marked " })
            vim.keymap.set("n", "<leader>N", function() harpoon:list():next() end,
                { desc = "Switch to previous file harpoon marked " })
        end,
    },
    {
        "folke/neoconf.nvim",
        config = function()
            require "neoconf".setup({
                local_settings = ".neoconf.json",
                global_settings = "neoconf.json",
                import = {
                    vscode = true,
                    coc = true,
                    nlsp = true,
                },
                live_reload = true,
                filetype_jsonc = true,
                plugins = {
                    lspconfig = {
                        enabled = true,
                    }
                },
                jsonls = {
                    enabled = true,
                    conmfigured_server_only = true
                },
                lua_ls = {
                    enabled_for_neovim_config = true,
                    enabled = false,
                }
            })
        end
    }
}
