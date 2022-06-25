local status_ok, _ = pcall(require, "indent_blankline")
if not status_ok then
	return
end

vim.cmd([[highlight IndentBlanklineIndent1 guifg=#1d2225 gui=nocombine]])
vim.cmd([[highlight IndentBlanklineIndent2 guifg=#2a3033 gui=nocombine]])

require("indent_blankline").setup {
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2"
  }
}
