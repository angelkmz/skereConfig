vim.opt.guicursor = ""

vim.o.mouse = 'a'                

vim.opt.number = true              
vim.opt.relativenumber = true      

vim.opt.showmatch = false           

vim.opt.tabstop = 4                
vim.opt.softtabstop = 4            
vim.opt.expandtab = true           
vim.opt.shiftwidth = 4             

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.undofile = true

vim.opt.hlsearch = false           
vim.opt.incsearch = true           

vim.opt.termguicolors = true

vim.opt.clipboard = 'unnamedplus'  

vim.opt.scrolloff = 8              
vim.opt.signcolumn = "yes"
--vim.o.sidescroll = 8             
--vim.o.copyindent = true       

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.

vim.opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
vim.opt.shortmess:append("c")

vim.opt.colorcolumn = "80"


--vim.cmd('filetype plugin indent on')

vim.g.mapleader = " "
