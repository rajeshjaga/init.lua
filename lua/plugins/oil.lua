return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
	require("oil").setup({
	    default_file_explorer = true,
	    columns = {
		"icon",
		"permissions",
		"size",
		"mtime"
	    },
	    buf_options = {
		buflisted = false,
		bufhidden = "hide",
	    },
	    win_options = {
		wrap = false,
		signcolumn = "no",
		cursorcolumn = false,
		foldcolumn = "0",
		spell = false,
		list = false,
		conceallevel = 3,
		concealcursor = "nvic",
	    },
	    delete_to_trash = false,
	    skip_confirm_for_simple_edits = false,
	    prompt_save_on_select_new_entry = true,
	    cleanup_delay_ms = 2000,
	    lsp_file_methods = {
		timeout_ms = 1000,
		autosave_changes = false,
	    },
	    constrain_cursor = "editable",
	    experimental_watch_for_changes = false,
	    use_default_keymaps = true,
	    view_options = {
		show_hidden = true,
		is_hidden_file = function(name, bufnr)
		    return vim.startswith(name, ".")
		end,
		is_always_hidden = function(name, bufnr)
		    return false
		end,
		natural_order = true,
		sort = {
		    { "type", "asc" },
		    { "name", "asc" },
		},
	    },
	    ssh = {
		border = "rounded",
	    },
	    keymaps_help = {
		border = "rounded",
	    },
	})
	vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Parent Directory" })
	vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open Parent Directory" })
    end
}
