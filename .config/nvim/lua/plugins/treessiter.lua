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
        "nix",
        "json",
        "yaml",
        "cmake",
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
