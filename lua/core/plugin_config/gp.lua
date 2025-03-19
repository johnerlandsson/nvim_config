local conf = {
  -- Setup providers
  providers = {
      openai = {
        disable = false,
        endpoint = "https://api.openai.com/v1/chat/completions",
        secret = {
          "bash",
          "-c",
          "cat ~/.config/openai.token",
        }
      },
    },

  -- Prefix for gp commands
  cmd_prefix = "Gp", 

  -- directory for storing chat files 
 	chat_dir = vim.fn.stdpath("data"):gsub("/$", "") .. "/gp/chats", 
}
require("gp").setup(conf)
