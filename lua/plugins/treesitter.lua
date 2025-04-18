return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            ---@diagnostic disable-next-line: missing-fields
            require("nvim-treesitter.configs").setup {
                auto_install = true,
                ensure_installed = {
                    "query",
                    "vim",
                    "vimdoc",
                    "markdown",
                    "markdown_inline",
                    "regex",
                    "lua",
                    "nix",
                    "typescript",
                    "javascript",
                    "html",
                    "css",
                    "graphql",
                    "scss",
                    "sql",
                    "svelte",
                    "vue",
                    "cmake",
                    "go",
                    "gitignore",
                    "gitcommit",
                    "http",
                },
                highlight = {
                    enable = true,
                    ---@diagnostic disable-next-line: unused-local
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = true,
                },
            }
        end
    }
}
