
vim.api.nvim_create_user_command("BufMovement", function ()
  vim.cmd(bnext)
end, {})

vim.keymap.set("n", "<TAB>", "<cmd>BufMovement<cr>", {desc = "Test tabbing"})
