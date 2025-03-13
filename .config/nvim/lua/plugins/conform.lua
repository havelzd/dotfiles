return {

  "stevearc/conform.nvim",
  opts = {},
  setup = function()
    local conform = require("conform")
    vim.keyma.set("n", "<leader>ff", conform.format)
    conform.setup({
      formatters = {
        prettier = {
          command = "node_modules/.bin/prettier",
        },
      },
    })
  end,
}
