local Remap = require("angel.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

nnoremap("<leader>pv", ":Ex<CR>")
nnoremap("<leader>u", ":UndotreeShow<CR>")

nnoremap("<leader>yf", ":let @+=expand(\'%:p\')<CR><CR>")
nnoremap("<leader>yd", ":let @+=expand(\'%:p:h\')<CR><CR>")

nnoremap("<leader>m", ":!make<CR>")
nnoremap("<leader>mc", ":!make clean<CR>")

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

xnoremap("<leader>p", "\"_dP")

nnoremap("<leader>y", "\"+y")
vnoremap("<leader>y", "\"+y")
nmap("<leader>Y", "\"+Y")

nnoremap("<leader>d", "\"_d")
vnoremap("<leader>d", "\"_d")

nnoremap("<leader>w", ":w<CR>")
nnoremap("<leader>q", ":q<CR>")

nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")

nnoremap("<C-q>", ":q!<CR>")
nnoremap("Q", "<NOP>")

nnoremap("<C-h>", "<C-W>h")
nnoremap("<C-j>", "<C-W>j")
nnoremap("<C-k>", "<C-W>k")
nnoremap("<C-l>", "<C-W>l")

nnoremap("<C-n>", ":tabnext<CR>")
nnoremap("<C-b>", ":tabprev<CR>")

nnoremap("<A-n>", ":bnext<CR>")
nnoremap("<A-b>", ":bprev<CR>")

nnoremap("<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
