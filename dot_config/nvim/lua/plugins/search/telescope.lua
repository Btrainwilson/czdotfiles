return {

  {"nvim-lua/plenary.nvim"},
  {"nvim-telescope/telescope.nvim",
    lazy = false,
    cmd = "Telescope",
    opts = {
      pickers = {
        colorscheme = {
          enable_preview = true
        }
      }
    },
    keys = {
      { "<leader><space>", function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end, desc = "Find Files (root dir)" },
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find Files (root dir)" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
----      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
      -- search
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sch", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader>sc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
      { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
      { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
      { "<leader>sC", "<cmd>Telescope colorscheme<cr>", desc = "Resume" },
      {
        "<leader>ss",
        function () require("telescope.builtin").telescope("lsp_document_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }) end,
        desc = "Goto Symbol",
      },
      {
        "<leader>sS",
        function() require("telescope.builtin").telescope("lsp_dynamic_workspace_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }) end,
        desc = "Goto Symbol (Workspace)",
      },

    },

},
}
--return {
--    {
--    "nvim-telescope/telescope.nvim",
--    lazy = false,
--    cmd = "Telescope",
--    keys = {
--      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
--      { "<leader>/", function() require("telescope").live_grep end, desc = "Grep (root dir)" },
--      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
--      { "<leader><space>", function() require("telescope.builtin").telescope("files")end, desc = "Find Files (root dir)" },
--      -- find
--      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
--      { "<leader>ff", function() require("telescope.builtin").telescope("files") end, desc = "Find Files (root dir)" },
--      { "<leader>fF", function() require("telescope.builtin").telescope("files", { cwd = false })end, desc = "Find Files (cwd)" },
--      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
--      { "<leader>fR", function() require("telescope.builtin").telescope("oldfiles", { cwd = vim.loop.cwd() }) end, desc = "Recent (cwd)" },
--      -- git
--      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
--      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
--      -- search
--      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
--      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
--      { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
--      { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
--      { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
--      { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
--      { "<leader>sg", function() require("telescope.builtin").telescope("live_grep")end, desc = "Grep (root dir)" },
--      { "<leader>sG", function() require("telescope.builtin").telescope("live_grep", { cwd = false })end, desc = "Grep (cwd)" },
--      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
--      { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
--      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
--      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
--      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
--      { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
--      { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
--      { "<leader>sw", function() require("telescope.builtin").telescope("grep_string")end , desc = "Word (root dir)" },
--      { "<leader>sW", function() require("telescope.builtin").telescope("grep_string", { cwd = false }) end , desc = "Word (cwd)" },
--      { "<leader>uC", function () require("telescope.builtin").telescope("colorscheme", { enable_preview = true }) end, desc = "Colorscheme with preview" },
--      {
--        "<leader>ss",
--        function () require("telescope.builtin").telescope("lsp_document_symbols", {
--          symbols = {
--            "Class",
--            "Function",
--            "Method",
--            "Constructor",
--            "Interface",
--            "Module",
--            "Struct",
--            "Trait",
--            "Field",
--            "Property",
--          },
--        }) end,
--        desc = "Goto Symbol",
--      },
--      {
--        "<leader>sS",
--        function() require("telescope.builtin").telescope("lsp_dynamic_workspace_symbols", {
--          symbols = {
--            "Class",
--            "Function",
--            "Method",
--            "Constructor",
--            "Interface",
--            "Module",
--            "Struct",
--            "Trait",
--            "Field",
--            "Property",
--          },
--        }) end,
--        desc = "Goto Symbol (Workspace)",
--      },
--    }}
--}
----    keys = {
----        {"<leader>/", false},
----
----        {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files"},
----
----        {"<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Find git files"},
----        {"<leader>ps", function()
----        require("telescope.builtin").grep_string({search = vim.fn.input("Grep > ")})
----        end, desc = "Find git files"},
----    }
