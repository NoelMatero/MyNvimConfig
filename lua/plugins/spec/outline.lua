---@type NvPluginSpec
return {
  "hedyhli/outline.nvim",
  cmd = { "Outline", "OutlineFocus" },
  init = function()
    vim.keymap.set("n", "<leader>oo", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
    vim.keymap.set("n", "<leader>of", "<cmd>OutlineFocus<CR>", { desc = "Toggle Outline focus" })
  end,
  config = function()
    require("outline").setup {}
  end,
}
