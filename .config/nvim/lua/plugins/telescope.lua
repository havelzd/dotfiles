return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ts", ":Telescope <CR>", {})
      vim.keymap.set("n", "<leader>p", builtin.find_files, {})
      vim.keymap.set("n", "<C-p>", builtin.git_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fs", builtin.grep_string, {})
      vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find, {})
      vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      telescope.load_extension("ui-select")
    end,
  },
}
