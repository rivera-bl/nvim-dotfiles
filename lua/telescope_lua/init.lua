local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    initial_mode = "insert",
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    file_ignore_patterns = {"Session.vim"},
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-l>"] = actions.select_default + actions.center,
        [",q"] = actions.close
      },
      n = {
        ["l"] = actions.select_default + actions.center,
        ["v"] = actions.select_vertical,
        ["h"] = actions.select_horizontal,
        ["t"] = actions.select_tab,
        ["u"] = actions.move_to_top,
        ["d"] = actions.move_to_bottom,
        [",q"] = actions.close
      },
    }
  },
  pickers = {
    buffers = {
      mappings = {
        n = {
          ["<C-d>"] = "delete_buffer",
        }
      }
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
M.search_files = function()
  require("telescope.builtin").find_files({
    prompt_title = vim.fn.expand("%:p:h"),
    cwd = vim.fn.expand("%:p:h"),
  })
end
M.search_dev = function()
  require("telescope.builtin").find_files({
    prompt_title = "<Dev Folder>",
    cwd = "~/dev",
  })
end
M.search_config = function()
  require("telescope.builtin").find_files({
    prompt_title = "<Neovim Dotfiles>",
    cwd = "~/.config/nvim",
  })
end
M.search_git = function()
  require("telescope.builtin").git_files({
    prompt_title = "<Parent Git Directory>",
    cwd = vim.fn.expand("%:p:h"),
  })
end

-- open telescope when opening a dir
-- not working with startify bookmarks
_G.open_telescope = function()
    local first_arg = vim.v.argv[2]
    if first_arg and vim.fn.isdirectory(first_arg) == 1 then
        vim.g.loaded_netrw = true
        require("telescope.builtin").find_files({search_dirs = {first_arg}})
    end
end

vim.api.nvim_exec([[
augroup TelescopeOnEnter
    autocmd!
    autocmd VimEnter * lua open_telescope()
augroup END
]], false)

return M
