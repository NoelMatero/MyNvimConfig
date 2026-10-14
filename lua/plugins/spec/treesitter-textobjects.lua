---@type NvPluginSpec
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    select = {
      lookahead = true,
      selection_modes = {
        ["@parameter.outer"] = "v",
        ["@function.outer"] = "V",
        ["@class.outer"] = "<c-v>",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter-textobjects").setup(opts)

    local map = vim.keymap.set
    local select = require "nvim-treesitter-textobjects.select"
    local swap = require "nvim-treesitter-textobjects.swap"

    local select_maps = {
      { "af", "@function.outer", "Select around function" },
      { "if", "@function.inner", "Select inner part of function" },
      { "ac", "@class.outer", "Select around class" },
      { "ic", "@class.inner", "Select inner part of class" },
      { "as", "@local.scope", "Select language scope", "locals" },
    }
    for _, m in ipairs(select_maps) do
      map({ "x", "o" }, m[1], function()
        select.select_textobject(m[2], m[4] or "textobjects")
      end, { desc = m[3] })
    end

    map("n", "<leader>wn", function()
      swap.swap_next "@parameter.inner"
    end, { desc = "Swap with next parameter" })
    map("n", "<leader>wp", function()
      swap.swap_previous "@parameter.inner"
    end, { desc = "Swap with previous parameter" })

    -- nvim-treesitter `main` dropped incremental selection; Neovim 0.12 ships it
    -- as the visual-mode `an` / `in` defaults, so map the old keys onto those.
    map("n", "<leader>is", "van", { remap = true, desc = "Start node selection" })
    map("x", "<Tab>", "an", { remap = true, desc = "Expand to parent node" })
    map("x", "<S-Tab>", "in", { remap = true, desc = "Shrink to child node" })
  end,
}
