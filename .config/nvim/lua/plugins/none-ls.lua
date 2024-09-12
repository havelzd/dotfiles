return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "jayp0521/mason-null-ls.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting -- to setup formatters
    local diagnostics = null_ls.builtins.diagnostics -- to setup linters

    require("mason-null-ls").setup({
      ensure_installed = {
        "prettier", -- ts/js formatter
        "stylua", -- lua formatter
        "eslint_d", -- ts/js linter
      },
      automatic_installation = true,
    })

    null_ls.setup({
      sources = {
        require("none-ls.diagnostics.eslint"),
        formatting.prettier.with({
          filetypes = { "html", "json", "typescript", "javascript", "css", "scss" },
          command = "node_modules/.bin/prettier",
        }),
        formatting.stylua,
      },
    })
    vim.keymap.set("n", "<leader>fl", vim.lsp.buf.format, {})
  end,
}
