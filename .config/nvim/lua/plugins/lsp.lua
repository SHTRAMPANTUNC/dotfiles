return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "clangd",
        "gopls",
        "json-lsp",
        "lua-language-server",
        "cmake-language-server",
        "clang-format",
      })
    end,
  },

  {
    "conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports" },
        cpp = { "clang_format" },
        c = { "clang_format" },
      },
    },
  },

  { "mfussenegger/nvim-lint", enabled = false },

  --LSP settings
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      return vim.tbl_deep_extend("force", opts, {
        diagnostics = { virtual_text = { prefix = "icons" } },
        inlay_hints = { enabled = false },
        servers = {
          clangd = {
            keys = {
              { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>" },
            },
            cmd = {
              "clangd",
              "--clang-tidy",
              "--background-index",
              "--pch-storage=memory",
              "--header-insertion=never",
              "--completion-style=detailed",
            },
            init_options = {
              usePlaceholders = true,
              completeUnimported = true,
              clangdFileStatus = true,
              fallbackFlags = { "-Wextra", "-Wall", "-Wpedantic" },
            },
          },
          gopls = {
            settings = {
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- stylua: ignore
      vim.list_extend(keys, {
        -- Replace fzf-lua to glance.nvim
        { "gd", "<CMD>Glance definitions<CR>", desc = "Goto Definition" },
        { "gr", "<CMD>Glance references<CR>",  desc = "References" },
        { "gI", "<CMD>Glance implementations<CR>",  desc = "Goto Implementation" },
        { "gy", "<CMD>Glance type_definitions<CR>",  desc = "Goto T[y]pe Definition" },
      })
    end,
  },
}
