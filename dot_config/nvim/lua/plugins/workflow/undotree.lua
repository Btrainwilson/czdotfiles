return {
    'mbbill/undotree',
    keys = {
        "<leader>u"
    },
    lazy = false,
    config = function(_, opts)
        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
    end
}
