-- autopairs
-- https://github.com/windwp/nvim-autopairs

---@module 'lazy'
---@type LazySpec
return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter', -- lazy load when entering insert mode
  -- config = function() require('nvim-autopairs').setup {} end,
  opts = {},
}
