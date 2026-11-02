return {
  'rmagatti/auto-session',
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- Close neo-tree before saving, so restoring a session doesn't fail with E95
    pre_save_cmds = { 'Neotree close' },
    -- log_level = 'debug',
  },
}
