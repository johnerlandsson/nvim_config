-- Set leader to comma
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Switch buffer with gn and gp
vim.keymap.set("n", "gn", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gp", ":bprevious<CR>", { noremap = true, silent = true })

-- Clear search highlights with leader-h
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- Show command being typed in lower right corner
vim.opt.showcmd = true

-- One status line per window
vim.opt.laststatus = 2

-- Highlight line at cursor
vim.opt.cursorline = true

-- Reload file if changed outside of vim unless unsaved changes
vim.opt.autoread = true

-- Save automatically when switching buffer
vim.opt.autowrite = true

-- Indentation stuff
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
vim.opt.expandtab = true

-- Window navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Rust specific keymaps
local function set_rust_keymaps()
  local opts = { noremap = true, silent = true, buffer = true }
  -- Set F5 to build
  vim.keymap.set("n", "<F5>", ':VimuxRunCommand("cargo build")<CR>', opts) 
  -- Set leader y to format code
  vim.keymap.set("n", "<leader>y", ':RustFmt<CR>', opts) 
  -- Set K to show info
vim.keymap.set("n", "K", ':call CocAction("doHover")<CR>', opts) 

end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = set_rust_keymaps
})
--
-- Python specific keymaps
local function set_python_keymaps()
  local opts = { noremap = true, silent = true, buffer = true }
  vim.keymap.set("n", "<leader>y", ':Autopep8<CR>', opts) 
  -- Set K to show info
vim.keymap.set("n", "K", ':call CocAction("doHover")<CR>', opts) 

end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = set_python_keymaps
})
