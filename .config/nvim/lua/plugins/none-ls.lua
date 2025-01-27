return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
        "jayp0521/mason-null-ls.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting -- to setup formatters

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
        vim.keymap.set("n", "<leader>fl", function()
            vim.lsp.buf.format({
                filter = function(client)
                    return client.name == "null-ls"
                end,
            })
        end, { desc = "Format file using null-ls" })

        -- vim.api.nvim_create_autocmd("LspAttach", {
        --     callback = function(args)
        --         local client = vim.lsp.get_client_by_id(args.data.client_id)
        --         if not client then
        --             return
        --         end
        --
        --         -- get filetype
        --         local filetype = vim.api.nvim_buf_get_option(args.buf, "filetype")
        --
        --         -- if type is typescript / javascript / html continue
        --         if filetype ~= "typescript" and filetype ~= "javascript" and filetype ~= "html" then
        --             return
        --         end
        --
        --         print(client.name, filetype)
        --
        --         -- get client name
        --         -- if client name is null-ls continue
        --         if client.name ~= "null-ls" then
        --             -- prevent client from formatting
        --             client.resolved_capabilities.document_formatting = false
        --             return
        --         end
        --
        --         if client.supports_method("textDocument/format") then
        --             vim.api.nvim_create_autocmd("BufWritePre", {
        --                 buffer = args.buf,
        --                 callback = function()
        --                     vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
        --                 end,
        --             })
        --         end
        --     end,
        -- })
    end,
}
