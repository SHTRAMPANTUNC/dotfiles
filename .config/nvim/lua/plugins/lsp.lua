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
      })
    end,
  },

  {
    "conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
        cpp = { "clang_format" },
        c = { "clang_format" },
      },
    },
  },

  --LSP settings
  {
    "neovim/nvim-lspconfig",
    opts = {
      intaly_hints = { enabled = true },
      diagnostics = { virtual_text = { prefix = "icons" } },
      ---@type lspconfig.options
      servers = {
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
        clangd = {
          cmd = {
            "clangd",
            "--clang-tidy",
            "--background-index",
            "--pch-storage=memory",
            "--header-insertion=never",
            "--completion-style=detailed",
            "--function-arg-placeholders=false",
          },
          init_options = {
            usePlaceholders = true,
            restartAfterCrash = true,
            completeUnimported = true,
            clangdFileStatus = true,
            semanticHighlighting = true,
            fallbackFlags = { "-Wextra", "-Wall", "-Wpedantic" },
          },
          filetypes = { "c", "cpp", "h", "cc", "hpp" },
        },
      },
    },
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
