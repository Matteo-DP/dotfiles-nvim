return {
  -- amongst your other plugins
  -- {
  --   'akinsho/toggleterm.nvim',
  --   version = '*',
  --   config = function() vim.keymap.set('v', '<leader>tt', ':ToggleTerm', { noremap = true, silent = true }) end,
  -- },
  -- or
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {},
    keys = {
      {
        '<leader>tt',
        ':ToggleTerm<cr>',
        desc = '[T]oggle [T]erminal',
        silent = true,
      },
    },
  },
}
