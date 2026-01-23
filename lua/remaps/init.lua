vim.keymap.set("n", "<leader>ne", ":vsp<CR>:Exp<CR>")
vim.keymap.set("n", "<leader>vs", ":vsp <CR>", { desc = "Split the current buffer vertical" })
vim.keymap.set("n", "<leader>v", ":sp <CR>", { desc = "Split the current buffer horizontally" })
vim.keymap.set("n", "Q", ":qa <CR>", { desc = "Close all damn it" })
vim.keymap.set("n", "gV", ":vertical all <CR>", { desc = "Vertical all the buffers" })
vim.keymap.set("n", "<leader>c", ":ColorizerAttachToBuffer <CR>", { desc = "Attach colorizer to current buffer" })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('i', 'jj', '<Esc>')

vim.keymap.set('t', 'tt', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-q>', '<C-w>q', { desc = " close the current buffer" })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>w', ":windo set nowrap<CR>", { desc = 'Disable [W]rap in during multiple windows' })

vim.keymap.set('n', "<leader>x", function()
    local config = vim.fn.stdpath('config')
    vim.cmd("source " + config)
end)
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>")
vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>")
