return {
  -- LSP Setup: nvim-lspconfig + Mason
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', opts = {} },
    { 'williamboman/mason-lspconfig.nvim', opts = {} },
    { 'WhoIsSethDaniel/mason-tool-installer.nvim', opts = {} },
    { 'j-hui/fidget.nvim', opts = {} }, -- LSP status updates
  },
  config = function()
    local lspconfig = require 'lspconfig'
    local mason = require 'mason'
    local mason_lsp = require 'mason-lspconfig'
    local tool_installer = require 'mason-tool-installer'

    -- 1️⃣ Mason setup
    mason.setup()

    -- 2️⃣ Ensure common LSPs are installed
    tool_installer.setup {
      ensure_installed = { 'bashls', 'lua_ls' },
    }

    -- 3️⃣ Mason-LSPConfig setup
    mason_lsp.setup { automatic_installation = true }

    -- 4️⃣ Attach all installed servers automatically
    -- mason_lsp.setup_handlers {
    --   function(server_name)
    --     lspconfig[server_name].setup {
    --       on_attach = function(client, bufnr)
    --         -- Keymaps & highlights when LSP attaches
    --         local map = function(keys, func, desc, mode)
    --           mode = mode or 'n'
    --           vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
    --         end
    --
    --         map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
    --         map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })
    --         map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    --         map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
    --
    --         if client.supports_method 'textDocument/documentHighlight' then
    --           local hl_group = vim.api.nvim_create_augroup('lsp_document_highlight', { clear = false })
    --           vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
    --             buffer = bufnr,
    --             group = hl_group,
    --             callback = vim.lsp.buf.document_highlight,
    --           })
    --           vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
    --             buffer = bufnr,
    --             group = hl_group,
    --             callback = vim.lsp.buf.clear_references,
    --           })
    --         end
    --
    --         if client.supports_method 'textDocument/inlayHint' then
    --           map('<leader>th', function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = bufnr }) end, '[T]oggle [H]int')
    --         end
    --       end,
    --       capabilities = vim.lsp.protocol.make_client_capabilities(),
    --     }
    --   end,
    -- }
  end,
}
