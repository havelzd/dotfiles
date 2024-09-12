return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "frappe",
        transparent_background = true,
        integrations = {
          treesitter = true,
          telescope = true,
          mason = true,
          cmp = true,
        },
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("tokyonight").setup({
        style = "storm",
      })
      -- vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        -- disable_background = true,
        dark_variant = "moon", -- auto,  main / moon / dawn
        styles = {
          italic = false,
        },
        enable = {
          terminal = true,
        },
      })

      -- vim.cmd.colorscheme("rose-pine")
    end,
  },
  {
    "morhetz/gruvbox",
    config = function()
      vim.o.background = "dark" -- light / dark
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    "xiantang/darcula-dark.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "briones-gabriel/darcula-solid.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
  },
  {
    "shaunsingh/nord.nvim",
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = false
      vim.g.nord_italic = false
      vim.g.nord_uniform_diff_background = true
      vim.g.nord_bold = false
    end,
  },
}
