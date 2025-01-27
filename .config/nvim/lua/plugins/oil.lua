return {
    {
        "stevearc/oil.nvim",
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} }, { "nvim-tree/nvim-web-devicons" } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
        config = function()
            require("oil").setup({
                vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent" }),
            })
        end,
    },
}
