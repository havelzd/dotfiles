-- return {
-- {
--   "hrsh7th/cmp-nvim-lsp",
-- },
-- {
--   "L3MON4D3/LuaSnip",
--   dependencies = {
--     "rafamadriz/friendly-snippets",
--   },
-- },
-- {
--   "hrsh7th/nvim-cmp",
--   config = function()
--     local cmp = require("cmp")
--     local luasnip = require("luasnip")
--     local cmp_select = { behavior = cmp.SelectBehavior.Select }
--
--     require("luasnip.loaders.from_vscode").lazy_load()
--
--     cmp.setup({
--       snippet = {
--         expand = function(args)
--           require("luasnip").lsp_expand(args.body)
--         end,
--       },
--       window = {
--         completion = cmp.config.window.bordered(),
--         documentation = cmp.config.window.bordered(),
--       },
--       mapping = cmp.mapping.preset.insert({
--         ["<Tab>"] = cmp.mapping(function(fallback)
--           if cmp.visible() then
--             cmp.select_next_item()
--           elseif luasnip.expandable() then
--             luasnip.expand()
--           else
--             fallback()
--           end
--         end, { "i", "s" }),
--         ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
--         ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
--         ["<CR>"] = cmp.mapping.confirm({ select = true }),
--         ["<C-Space>"] = cmp.mapping.complete(),
--       }),
--       sources = cmp.config.sources({
--         { name = "nvim_lsp" },
--         { name = "luasnip" }, -- For luasnip users.
--       }, {
--         { name = "buffer" },
--       }),
--     })
--   end,
-- },
-- }
return {
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },

        config = function()
            local ls = require("luasnip")
            ls.filetype_extend("javascript", { "jsdoc" })

            vim.keymap.set({ "i" }, "<C-s>e", function()
                ls.expand()
            end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-s>;", function()
                ls.jump(1)
            end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-s>,", function()
                ls.jump(-1)
            end, { silent = true })

            vim.keymap.set({ "i", "s" }, "<C-E>", function()
                if ls.choice_active() then
                    ls.change_choice(1)
                end
            end, { silent = true })
        end,
    },
}
