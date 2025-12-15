--Define a command
vim.api.nvim_create_user_command("Greet", function ()
  print("Hello from my command")
end, {})


vim.keymap.set("n", "<leader>p", "<cmd>Greet<cr>", {desc = "Run Greet Command"})


vim.keymap.set("n", "<leader>fp", function()
  vim.lsp.util.open_floating_preview(
    { "My custom text" },
    "markdown",
    { border = "double" }
  )
end)
