-- Reselect visual selection after indenting
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

local builtin = require 'telescope.builtin'
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

-- Will open window as split, but with picker first (telescope)
local function split_with_picker(split_cmd)
  builtin.buffers {
    attach_mappings = function(prompt_bufnr, map)
      local function open_split()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        vim.cmd(split_cmd)
        vim.cmd('buffer ' .. selection.bufnr)
      end

      map('i', '<CR>', open_split)
      map('n', '<CR>', open_split)
      return true
    end,
  }
end

vim.keymap.set('n', '<C-w>v', function() split_with_picker 'vsplit' end)

vim.keymap.set('n', '<C-w>s', function() split_with_picker 'split' end)
