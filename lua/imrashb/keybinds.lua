-- Remove highlighting when pressing escape after search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Search stay middle of screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move with shift and J or K
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Goofy ahh Copy
vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[f]ind [f]iles" })
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "[f]ind [w]ord" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[f]ind [b]uffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[f]ind [h]elp" })
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "[f]ind [r]eferences" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "[f]ind [o]ld files" })

-- Diffview
vim.keymap.set("n", "<leader>gdo", "<cmd>:DiffviewOpen<CR>", { desc = "[g]it [d]iff [o]pen" })
vim.keymap.set("n", "<leader>gdc", "<cmd>:DiffviewClose<CR>", { desc = "[g]it [d]iff [c]lose" })

-- GitBlame
vim.keymap.set("n", "<leader>gdb", "<cmd>:GitBlameOpenCommitURL<CR>", { desc = "[g]it [d]iff [b]lame" })

-- LSP Keybinds
-- Open Definition Preview
vim.keymap.set("n", "<leader>gpp", vim.lsp.buf.hover, { desc = "[g]oto [pp]review" })
vim.keymap.set("n", "<leader>gpa", vim.lsp.buf.code_action, { desc = "[g]oto [p]review [a]ctions" })
-- Rename
vim.keymap.set("n", "<leader>re", vim.lsp.buf.rename, { desc = "[re]name" })

-- Diagnostics
vim.keymap.set("n", "<leader>gpd", vim.diagnostic.open_float, { desc = "[g]oto [p]review [d]iagnostics" })
vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

-- Code Companion
vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })
