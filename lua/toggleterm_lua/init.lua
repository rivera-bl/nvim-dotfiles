require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.3
    end
  end,
  shade_terminals = false,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  start_in_insert = true,
  insert_mappings = false, -- whether or not the open mapping applies in insert mode
  persist_size = false,
  direction = 'horizontal', -- 'float', 'vertical' | 'horizontal' | 'window' | 'float'
  -- close_on_exit = true, -- close the terminal window when the process exits
  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_win_open'
    -- see :h nvim_win_open for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'single',
    -- width = <value>,
    -- height = <value>,
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}

local Terminal  = require('toggleterm.terminal').Terminal
local term_vertical = Terminal:new({
  direction = "vertical",
  -- function to run on opening the terminal
  -- on_open = function(term)
  --   vim.cmd("startinsert!")
  --   vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  -- end,
  -- function to run on closing the terminal
  -- on_close = function(term)
  --   vim.cmd("Closing terminal")
  -- end,
})

function _term_vertical_toggle()
  term_vertical:toggle()
end
