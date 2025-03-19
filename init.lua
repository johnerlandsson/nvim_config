require("core.keymaps")
require("core.plugins")
require("core.plugin_config")

-- Copy to clipboard
vim.opt.clipboard = "unnamedplus"

vim.o.exrc = true
vim.o.secure = true  -- Prevents execution of unsafe commands
