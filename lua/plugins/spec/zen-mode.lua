---@type NvPluginSpec
return {
  "folke/zen-mode.nvim",
  dependencies = { "folke/twilight.nvim" },
  cmd = "ZenMode",
  keys = {
    {
      "<leader>z",
      "<cmd>ZenMode<CR>",
      desc = "General toggle Zen Mode",
    },
  },
  opts = {
    plugins = {
      -- Twilight dims everything but the current paragraph, which fights
      -- reading a whole document. Keep the plugin available via :Twilight.
      twilight = { enabled = false },
    },
    window = {
      -- ~90 columns is the comfortable measure for long prose, and roughly
      -- what GitHub caps its rendered markdown column at.
      width = 90,
      options = {
        number = false,
        relativenumber = false,
        signcolumn = "no",
        foldcolumn = "0",
      },
    },
  },
}
