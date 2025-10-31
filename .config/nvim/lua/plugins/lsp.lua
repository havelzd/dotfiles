return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "j-hui/fidget.nvim",
    "saghen/blink.cmp",
  },

  config = function()
    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      automatic_installation = false,
      automatic_enable = {
        exclude = { "gopls" },
      },
      ensure_installed = {
        "angularls",
        "lua_ls",
        "ts_ls",
      },
    })

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

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename)
    vim.keymap.set("n", "gR", vim.lsp.buf.references, {})
  end,
}
