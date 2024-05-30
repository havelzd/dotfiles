return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                require("none-ls.diagnostics.eslint"),
                null_ls.builtins.formatting.prettier.with({ only_local = "node_modules/.bin" }),
                null_ls.builtins.formatting.stylua,
            },
        })
        vim.keymap.set("n", "<leader>fl", vim.lsp.buf.format, {})
    end,
}
