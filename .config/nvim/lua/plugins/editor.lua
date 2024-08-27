return {
  { "which-key.nvim", enabled = false },

  {
    "neo-tree.nvim",
    -- stylua: ignore
    keys = {
      { "<leader>n", function() require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() }) end, },},
    opts = {
      popup_border_style = "rounded",
      window = {
        position = "float",
      },
    },
  },

  {
    "fzf-lua",
    -- stylua: ignore
    keys = function()
      return {
        { "<c-j>", "<c-j>", ft = "fzf", mode = "t", nowait = true },
        { "<c-k>", "<c-k>", ft = "fzf", mode = "t", nowait = true },
        { ";f", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
        { ";r", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
        { ";gs", "<cmd>FzfLua git_status<CR>", desc = "Status" },
        { ";gc", "<cmd>FzfLua git_commits<CR>", desc = "Commits" },
        { ";;", function() require("fzf-lua").resume() end, desc = "Resume", },
      }
    end,
  },

  {
    "DNLHC/glance.nvim",
    event = "LspAttach",
  },
}
