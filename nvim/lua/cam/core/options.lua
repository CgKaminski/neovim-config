local opt = vim.opt -- elimates "vim." requirement

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indents
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = false

-- line wrapping
opt.wrap = false

-- searching settings
opt.ignorecase = true
opt.smartcase = true

-- guide column
opt.colorcolumn = "120"

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

