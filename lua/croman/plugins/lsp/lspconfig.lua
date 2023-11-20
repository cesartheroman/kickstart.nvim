return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require 'lspconfig'

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require 'cmp_nvim_lsp'

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = '[R]e[n]ame'
      keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = '[C]ode [A]ction'
      keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = '[G]oto [D]efinition'
      keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<CR>', opts) -- show lsp definitions

      opts.desc = '[G]oto [R]eferences'
      keymap.set('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts) -- show definition, references

      opts.desc = '[G]oto [I]implementation'
      keymap.set('n', 'gI', '<cmd>Telescope lsp_implementations<CR>', opts) -- show lsp implementations

      opts.desc = '[G]oto [T]ype definition'
      keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', opts) -- show lsp type definitions

      opts.desc = '[D]ocument [S]ymbols'
      keymap.set('n', '<leader>ds', '<cmd>Telescope lsp_document_symbols<CR>', opts) -- show lsp type definitions

      opts.desc = '[W]orkspace [S]ymbols'
      keymap.set('n', '<leader>ws', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', opts) -- show lsp type definitions

      -- See `:help K` for why this keymap
      opts.desc = 'Hover Documentation'
      keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = 'Signature Documentation'
      keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

      -- Lesser used LSP functionality
      opts.desc = '[G]oto [D]eclaration'
      keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

      opts.desc = '[W]orkspace [A]dd Folder'
      keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)

      opts.desc = '[W]orkspace [R]emove Folder'
      keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)

      opts.desc = '[W]orkspace [L]ist Folders'
      keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)

      -- Buffer Diagnostics
      opts.desc = 'Show buffer diagnostics'
      keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = 'Go to previous diagnostic'
      keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      keymap.set('n', ']d', vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      -- Restart LSP
      opts.desc = 'Restart LSP'
      keymap.set('n', '<leader>rs', ':LspRestart<CR>', opts) -- mapping to restart lsp if necessary
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
    end

    -- configure clangd server
    lspconfig['clangd'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure Go server
    lspconfig['gopls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure html server
    lspconfig['html'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure typescript server with plugin
    lspconfig['tsserver'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure css server
    lspconfig['cssls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure tailwindcss server
    lspconfig['tailwindcss'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure prisma orm server
    lspconfig['prismals'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure graphql language server
    lspconfig['graphql'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { 'graphql', 'gql', 'svelte', 'typescriptreact', 'javascriptreact' },
    }

    -- configure emmet language server
    lspconfig['emmet_ls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'svelte' },
    }

    -- configure python server
    lspconfig['pyright'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    -- configure lua server (with special settings)
    lspconfig['lua_ls'].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand '$VIMRUNTIME/lua'] = true,
              [vim.fn.stdpath 'config' .. '/lua'] = true,
            },
          },
        },
      },
    }
  end,
}
