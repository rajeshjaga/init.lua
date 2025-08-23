return {
    "epwalsh/obsidian.nvim",
    version = "*",
    -- lazy = true,
    -- ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require('obsidian').setup({
            workspaces = {
                {
                    name = "personal",
                    path = "~/obsidian/test/"
                }
            }
        })
        vim.keymap.set("n", "<leader>os", "<cmd>ObsidianOpen<cr>", {})
    end
}
