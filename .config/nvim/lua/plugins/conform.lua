return {

  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        graphql = { "prettier" },
        markdown = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        go = { "gofmt" },
        html = { "prettier" },
        htmlangular = { "prettier" },
        python = { "autopep8" },
        vue = { "prettier" },
      },
      formatters = {
        gopls = {
          command = "/home/zhavelka/go/bin/gopls",
          args = { "fmt", vim.api.nvim_buf_get_name(0) },
          stdin = false,
        },
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>fl", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
