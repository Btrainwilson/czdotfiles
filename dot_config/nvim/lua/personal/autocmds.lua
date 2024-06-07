
-- Reload config files

-- kitty
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "~/.config/kitty/kitty.conf",
  command = ":silent !kill -SIGUSR1 $(pgrep -a kitty)"
})

-- tmux
-- Define the autocmd to reload tmux.conf
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "~/.tmux.conf",
  command = ":silent !tmux source-file ~/.tmux.conf; tmux display-message 'Reloaded ~/.tmux.conf!'"
})

