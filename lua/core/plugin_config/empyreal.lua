-- Empyreal programs are .cart files; until empyreal_code renames its .txt
-- ones, also tell those apart by their
-- first line of code (program/on/setting/every/def at the left margin).
local function detect(_, bufnr)
  for _, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, 30, false)) do
    if not line:match("^%s*$") and not line:match("^%s*;") then
      if line:match("^program%s+[%a_]")
        or line:match("^on%s+[%a_]")
        or line:match("^setting%s+[%a_]")
        or line:match("^every%s")
        or line:match("^def%s+[%a_]") then
        return "empyreal"
      end
      return
    end
  end
end

vim.filetype.add({
  extension = {
    cart = "empyreal",
  },
  pattern = {
    [".*%.txt"] = { detect, { priority = 10 } },
  },
})
