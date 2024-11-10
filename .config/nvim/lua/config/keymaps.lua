local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Exit
map("n", "q", ":close<CR>", opts)

-- Without clipboard
map("n", "C", '"_C')
map("n", "D", '"_D')
map("x", "p", '"_c<Esc>p')

-- Better remove actions
map("n", "dw", 'vb"_d')
map("n", "x", '"_x')

-- Split
map("n", "\\", ":split<CR>", opts)
map("n", "|", ":vsplit<CR>", opts)

-- Tabs
map("n", "te", ":tabedit")
map("n", "<tab>", ":tabnext<CR>", opts)
map("n", "<s-tab>", ":tabprev<CR>", opts)

-- Clear hlsearch
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

-- Move to start/end line
map({ "n", "x" }, "H", "^")
map({ "n", "x" }, "L", "g_")

-- Select All
map("n", "<leader>a", "gg<S-v>G")

-- Better indenting
map("x", "<S-tab>", "<gv")
map("x", "<tab>", ">gv|")
