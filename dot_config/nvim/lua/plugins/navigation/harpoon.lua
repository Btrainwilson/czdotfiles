return {
  -- {{{ Define the Harpoon lazy.vim specificaiton.

  "ThePrimeagen/harpoon",

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Define events to load Harpoon.
  lazy = false,
  keys = {
    "<C-a-1>",
    "<C-a-2>",
    "<C-a-3>",
    "<C-a-4>",
    "<C-a-5>",
    "<a-1>",
    "<a-2>",
    "<a-3>",
    "<a-4>",
    "<a-5>",
    "<a-6>",
    "<leader>hl",
    "<leader>e",
    "<leader>a",
  },

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Use Harpoon defaults or my customizations.

  -- ----------------------------------------------------------------------- }}}
  -- {{{ Configure harpoon.

  config = function(_, opts)
    require("harpoon").setup(opts)
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    local term = require("harpoon.term")

    vim.keymap.set("n", "<C-a-1>", function()
      term.gotoTerminal(1)
    end)
    vim.keymap.set("n", "<C-a-2>", function()
      term.gotoTerminal(2)
    end)
    vim.keymap.set("n", "<C-a-3>", function()
      term.gotoTerminal(3)
    end)
    vim.keymap.set("n", "<C-a-4>", function()
      term.gotoTerminal(4)
    end)
    vim.keymap.set("n", "<C-a-5>", function()
      term.gotoTerminal(5)
    end)
    vim.keymap.set("n", "<C-a-6>", function()
      term.gotoTerminal(6)
    end)
    -- Harpoon marked files 1 through 4.
    vim.keymap.set("n", "<a-1>", function()
      ui.nav_file(1)
    end)
    vim.keymap.set("t", "<a-1>", function()
      ui.nav_file(1)
    end)
    vim.keymap.set("n", "<a-2>", function()
      ui.nav_file(2)
    end)
    vim.keymap.set("t", "<a-2>", function()
      ui.nav_file(2)
    end)
    vim.keymap.set("n", "<a-3>", function()
      ui.nav_file(3)
    end)
    vim.keymap.set("t", "<a-3>", function()
      ui.nav_file(3)
    end)
    vim.keymap.set("n", "<a-4>", function()
      ui.nav_file(4)
    end)
    vim.keymap.set("t", "<a-4>", function()
      ui.nav_file(4)
    end)


    -- Harpoon user interface.
    vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)
    vim.keymap.set("t", "<C-e>", ui.toggle_quick_menu)
    vim.keymap.set("n", "<leader>a", mark.add_file)

    -- Automatic harpoon
    vim.keymap.set("n", "<a-c>", function()
            require("harpoon.tmux").sendCommand("{down-of}", "make\n")
        end)

  end,

  -- ----------------------------------------------------------------------- }}}
}
