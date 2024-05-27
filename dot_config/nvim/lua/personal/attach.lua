local autorun = {}

function autorun.attach_to_bufnr(bufnr, pattern, command)
  vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = pattern,
    group = vim.api.nvim_create_augroup("blake-automagic", {clear = true}),
    callback = function()
      append_data = function(_, data)
            if data then
              vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
            end
          end

      vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {'Output'})
      vim.fn.jobstart(command,
        {stdout_buffered = true,
          on_stdout = append_data,
          on_stderr = append_data,
        })
    end,
  })
end

return autorun
