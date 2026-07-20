-- Neovim equivalent of ~/.vimrc.

vim.cmd("syntax on")
vim.cmd("filetype on")

local opt = vim.opt

-- General
opt.encoding = "utf-8"
opt.bomb = false
opt.incsearch = true
opt.hlsearch = true
opt.clipboard = "unnamed"
opt.background = "dark"
opt.termguicolors = true

-- No audible or visible bell on errors
opt.errorbells = false
opt.visualbell = false
opt.timeoutlen = 500

-- Backups and swap files
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Text, tabs, and indentation
opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.linebreak = true
opt.textwidth = 500
opt.autoindent = true
opt.smartindent = true
opt.wrap = true

-- Status line
opt.laststatus = 2
_G.HasPaste = function()
    return vim.o.paste and "PASTE MODE  " or ""
end
opt.statusline = " %{v:lua.HasPaste()}%F%m%r%h [%l,%v][%p%%] %w  CWD: %r%{getcwd()}%h"

-- Treat JSON as JSON while using JavaScript syntax highlighting, matching ~/.vimrc.
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    pattern = "*.json",
    callback = function()
        vim.bo.filetype = "json"
        vim.bo.syntax = "javascript"
    end,
})

-- Neovim 0.12's built-in package manager installs/loads Catppuccin.
vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

require("catppuccin").setup({
    flavour = "mocha",
    background = {
        light = "latte",
        dark = "mocha",
    },
})

vim.cmd.colorscheme("catppuccin-nvim")
