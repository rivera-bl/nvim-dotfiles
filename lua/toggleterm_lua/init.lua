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
  -- close_on_exit = true, -- close the terminal window when the process exits
  -- This field is only relevant if direction is set to 'float'
}

local Terminal  = require('toggleterm.terminal').Terminal

-- vertical terminal
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

-- horizontal terminal
local term_horizontal = Terminal:new({
  direction = "horizontal",
})

-- floating terminal
local term_float = Terminal:new({
  direction = "float",
  float_opts = {
    border = 'single',
    width = 110,
    height = 25,
    highlights = {}
  },   
})

function _term_horizontal_toggle()
  term_horizontal:toggle()
end

function _term_vertical_toggle()
  term_vertical:toggle()
end

function _term_float_toggle()
  term_float:toggle()
end
