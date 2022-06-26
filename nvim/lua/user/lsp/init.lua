-- for a list of installation per language server: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})
require("user.lsp.handlers").setup()

-- SERVERS
-- requires ninja and bash
require'lspconfig'.sumneko_lua.setup {
  on_attach = require("user.lsp.handlers").on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- requires npm
require'lspconfig'.jsonls.setup{
  on_attach = require("user.lsp.handlers").on_attach,
}
require'lspconfig'.bashls.setup{
  on_attach = require("user.lsp.handlers").on_attach,
}

-- requires yarn
-- https://www.schemastore.org/json/
require'lspconfig'.yamlls.setup {
  on_attach = require("user.lsp.handlers").on_attach,
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.yaml",
      },
    },
  }
}

-- requires rust
require'lspconfig'.rnix.setup{
  on_attach = require("user.lsp.handlers").on_attach,
}

-- terraform
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

require'lspconfig'.terraformls.setup{
  on_attach = require("user.lsp.handlers").on_attach,
  capabilities = capabilities
}
