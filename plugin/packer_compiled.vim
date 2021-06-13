" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/rvv/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/rvv/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/rvv/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/rvv/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/rvv/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["ansible-vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/rvv/.local/share/nvim/site/pack/packer/opt/ansible-vim"
  },
  ["ayu-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/rvv/.local/share/nvim/site/pack/packer/opt/ayu-vim"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/rvv/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  indentLine = {
    after_files = { "/home/rvv/.local/share/nvim/site/pack/packer/opt/indentLine/after/plugin/indentLine.vim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/rvv/.local/share/nvim/site/pack/packer/opt/indentLine"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/rvv/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/rvv/.local/share/nvim/site/pack/packer/opt/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/rvv/.local/share/nvim/site/pack/packer/opt/popup.nvim"
  },
  ["telescope.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/rvv/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["vim-airline"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/rvv/.local/share/nvim/site/pack/packer/opt/vim-airline"
  },
  ["vim-checkbox"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/rvv/.local/share/nvim/site/pack/packer/opt/vim-checkbox"
  },
  ["vim-hcl"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/rvv/.local/share/nvim/site/pack/packer/opt/vim-hcl"
  },
  ["vim-javascript"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/rvv/.local/share/nvim/site/pack/packer/opt/vim-javascript"
  },
  ["vim-markdown"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/rvv/.local/share/nvim/site/pack/packer/opt/vim-markdown"
  },
  vimwiki = {
    loaded = false,
    needs_bufread = true,
    path = "/home/rvv/.local/share/nvim/site/pack/packer/opt/vimwiki"
  },
  ["zeavim.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/rvv/.local/share/nvim/site/pack/packer/opt/zeavim.vim"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
