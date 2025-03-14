return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",
    "saghen/blink.cmp",
  },

  config = function()
    local util = require("lspconfig.util")
    local lspconfig = require("lspconfig")
    local blink = require("blink.cmp")
    local capabilities =
      vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), blink.get_lsp_capabilities())

    local on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
    end
    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_installation = false,
      ensure_installed = {
        "angularls",
        "lua_ls",
        "ts_ls",
        "volar",
      },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
      },
    })

    -- local cmp_select = { behavior = cmp.SelectBehavior.Select }

    -- cmp.setup({
    --   snippet = {
    --     expand = function(args)
    --       require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    --     end,
    --   },
    --   mapping = cmp.mapping.preset.insert({
    --     ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    --     ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    --     ["<CR>"] = cmp.mapping.confirm({ select = true }),
    --     ["<C-Space>"] = cmp.mapping.complete(),
    --   }),
    --   sources = cmp.config.sources({
    --     { name = "nvim_lsp" },
    --     { name = "luasnip" }, -- For luasnip users.
    --   }, {
    --     { name = "buffer" },
    --   }),
    --   window = {
    --     completion = cmp.config.window.bordered(),
    --     documentation = cmp.config.window.bordered(),
    --   },
    -- })

    vim.diagnostic.config({
      -- update_in_insert = true,
      virtual_text = true,
      signs = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
      },
    })

    -- local angular_cmd = {
    --     "node",
    --     "/usr/lib/node_modules/@angular/language-server",
    --     "--stdio",
    --     "--ngProbeLocations",
    --     "/usr/lib/node_modules",
    --     "--tsProbeLocations",
    --     "/usr/lib/node_modules",
    -- }
    -- lspconfig.angularls.setup({
    --     root_dir = util.root_pattern("angular.json", "project.json"),
    --     cmd = angular_cmd,
    --     on_new_config = function(new_config, new_root_id)
    --         new_config.cmd = angular_cmd
    --     end,
    --     capabilities = capabilities,
    -- })

    -- Setup LS

    vim.filetype.add({
      pattern = {
        [".*%.component%.html"] = "htmlangular", -- Sets the filetype to `htmlangular` if it matches the pattern
      },
    })

    lspconfig.angularls.setup({
      capabilities = capabilities,
      root_dir = util.root_pattern("angular.json", "project.json"),
    })
    lspconfig.lua_ls.setup({ capabilities = capabilities })

    lspconfig.html.setup({
      capabilities = capabilities,
    })
    lspconfig.cssls.setup({ capabilities = capabilities })
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
    })
    lspconfig.lua_ls.setup({ capabilities = capabilities })
    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
      cmd = { "rust-analyzer" },
    })
    lspconfig.gopls.setup({
      capabilities = capabilities,
      cmd = { "/home/zhavelka/go/bin/gopls" },
    })
    lspconfig.volar.setup({ capabilities = capabilities })
    lspconfig.tailwindcss.setup({ capabilities = capabilities })

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename)
    vim.keymap.set("n", "gR", vim.lsp.buf.references, {})
  end,
}
