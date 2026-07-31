require('nvim-treesitter.configs').setup {
  ensure_installed = {
                      "c",
                      "lua",
                      "rust",
                      "python",
                      "vim",
                      "json",
                      "elixir",
                    },

  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
}
