return {
  {
    "nvim-treesitter",
    opts = {
      ensure_installed = {
        "c",
        "go",
        "cpp",
        "sql",
        "lua",
        "json",
        "yaml",
        "cmake",
        "python"
      },
    },
  },
  -- {
  --   "nvim-treesitter-context",
  --   config = function()
  --     require("treesitter-context").setup({
  --       enable = true,
  --       max_lines = 1,
  --     })
  --   end,
  -- },
}
