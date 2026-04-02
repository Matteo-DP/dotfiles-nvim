return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  -- update_focused_file = { enable = true },
  config = function()
    require('nvim-tree').setup {}
    vim.keymap.set('n', '<leader>tg', ':NvimTreeToggle<cr>', { silent = true, noremap = true })
    vim.keymap.set('n', '<leader>e', ':NvimTreeFindFile<cr>', {
      desc = 'Focus current fil[e]',
    })
  end,
}
