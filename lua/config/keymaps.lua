local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Increment/Decrement
--keymap.set("n", "+", "<C-a>")
--keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", "dbdl", opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
--keymap.set("n", "<C-m>", "<C-i>", opts)

-- Leader Commands | Used
-- a               |
-- b               |
-- c               |
-- d               | X
-- e               |
-- f               |
-- g               |
-- h               |
-- i               |
-- k               |
-- l               |
-- m               |
-- n               |
-- o               |
-- p               |
-- q               | X
-- r               |
-- s               | X
-- t               |
-- u               |
-- v               |
-- w               | X
-- x               |
-- y               |
-- z               |

-- Save and Exit
keymap.set("n", "<leader>w", ":w<CR>", opts)
keymap.set("n", "<leader>q", ":q<CR>", opts)

-- New Tab
keymap.set("n", "sv", ":vsplit<CR>", opts)
keymap.set("n", "ss", ":split<CR>", opts)

keymap.set("n", "sh", "<C-w>h", opts)
keymap.set("n", "sl", "<C-w>l", opts)
keymap.set("n", "sj", "<C-w>j", opts)
keymap.set("n", "sk", "<C-w>k", opts)

keymap.set("n", "<C-j>", ":resize -1<CR>", opts)
keymap.set("n", "<C-k>", ":resize +1<CR>", opts)
keymap.set("n", "<C-h>", ":vertical resize -1<CR>", opts)
keymap.set("n", "<C-l>", ":vertical resize +1<CR>", opts)
