require("core.keymaps")
require("core.plugins")
require("core.plugin_config")

-- Copy to clipboard
vim.opt.clipboard = "unnamedplus"

-- Allow local config files
vim.o.exrc = true
vim.o.secure = true  -- Prevents execution of unsafe commands

-- Setup relative line numbering
vim.opt.number = true
vim.opt.relativenumber = true
