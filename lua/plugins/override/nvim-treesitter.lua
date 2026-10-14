---@type NvPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  -- NvChad v2.5 targets the `main` rewrite, which no longer reads `highlight`,
  -- `indent`, etc. Highlighting is started by NvChad's FileType autocmd.
  branch = "main",
  -- `main` does not support lazy-loading: its queries must be on the rtp before
  -- the first FileType event, or the first buffer opened gets no highlighting.
  lazy = false,
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "css",
      "haskell",
      "html",
      "http",
      "javascript",
      "json",
      "latex",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "printf",
      "rust",
      "scheme",
      "scss",
      "toml",
      "typescript",
      "vim",
      "vimdoc",
    },
  },
  config = function(_, opts)
    local ts = require "nvim-treesitter"
    ts.setup()

    -- Install anything missing (async, no-op when already present), so a fresh
    -- clone gets its parsers without running :TSInstallAll by hand.
    -- Requires the `tree-sitter` CLI (`brew install tree-sitter-cli`).
    local missing = vim.tbl_filter(function(lang)
      return not vim.list_contains(ts.get_installed(), lang)
    end, opts.ensure_installed)
    if #missing > 0 then
      ts.install(missing)
    end

    vim.api.nvim_create_autocmd("FileType", {
      desc = "Use treesitter-based indentation.",
      group = vim.api.nvim_create_augroup("TreesitterIndent", { clear = true }),
      callback = function(args)
        if vim.treesitter.language.get_lang(vim.bo[args.buf].filetype) then
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
