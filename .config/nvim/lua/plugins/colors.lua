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
        terminal_colors = true,
      })
      -- vim.cmd.colorscheme("catppuccin")
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
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = "hard" -- hard | medium | soft
      vim.g.gruvbox_material_foreground = "original" -- material | mix | original
      vim.g.gruvbox_material_transparent_background = 2 -- 0 | 1 | 2
      vim.g.gruvbox_material_ui_contrast = "high" -- "high" | "low"
      vim.g.gruvbox_material_diagnostic_line_highlight = 1
      vim.g.gruvbox_material_diagnostic_text_highlight = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_statusline_style = "mix"
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    config = function()
      -- vim.cmd.colorscheme("oxocarbon")
    end,
  },
  {
    "CosecSecCot/cosec-twilight.nvim",
    config = function()
      -- vim.cmd.colorscheme("cosec-twilight")
    end,
  },
}
