local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    initial_mode = "insert",
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-l>"] = actions.select_default + actions.center,
      },
      n = {
        ["u"] = actions.move_to_top,
        ["d"] = actions.move_to_bottom,
        ["l"] = actions.select_vertical,
        ["h"] = actions.select_horizontal,
        ["t"] = actions.select_tab,
        [",q"] = actions.close
      },
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = false, -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
require('telescope').load_extension('fzf')

local M = {}
M.search_dev = function()
  require("telescope.builtin").find_files({
    prompt_title = "<Dev Folder>",
    cwd = "~/dev/",
  })
end
return M
