return {
    dir = "~/personal/repo/recent-file-picker.nvim",
    config = function()
        local rfp = require("recent-file-picker")
        vim.keymap.set("n", "<leader>e", "<cmd>RFP<cr>")
        rfp.setup()
    end,
}
