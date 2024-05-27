return {
    {'VonHeikemen/lsp-zero.nvim',
        
      dependencies = {
            {"SmiteshP/nvim-navbuddy",
              dependencies = {
                "SmiteshP/nvim-navic",
                "MunifTanjim/nui.nvim",
                },
              config = function() 
                local navbuddy = require("nvim-navbuddy")

                require("lspconfig").clangd.setup {
                    on_attach = function(client, bufnr)
                        navbuddy.attach(client, bufnr)
                    end
                }
              end
            },

        -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
              'williamboman/mason.nvim',
              build = function()
                pcall(vim.cmd, 'MasonUpdate')
              end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp',
                },     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
            }
        },
      config = function(_, opt)
            local lsp = require('lsp-zero').preset({})
            lsp.preset("recommended") 

            lsp.on_attach(function(client, bufnr)
              local opts = {buffer = bufnr, remap = false}

              vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
              vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
              vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
              vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
              vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
              vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
              vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
              vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
              vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
              vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            end)
            lsp.setup()
        end,
      branch = 'v2.x',
{
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
  },
  opts = function()
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()
    return {
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

        ['<C-y>'] = cmp.mapping.confirm({select = true}),

        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<S-CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp", keyword_length = 1 },
        { name = "luasnip", keyword_length = 2 },
        { name = "buffer",  keyword_length = 3},
        { name = "path" },
      }),

      window = {
        documentation = cmp.config.window.bordered()
      },
      formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
          local menu_icon = {
            nvim_lsp = 'λ',
            luasnip = '⋗',
            buffer = 'Ω',
            path = '🖫',
          }

          item.menu = menu_icon[entry.source.name]
          return item
        end,
      },      experimental = {
        ghost_text = {
          hl_group = "CmpGhostText",
        },
      },
      sorting = defaults.sorting,
    }
  end,
}
}
