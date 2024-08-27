return {
  {
    "dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
       ███████╗██╗  ██╗████████╗██████╗  █████╗ ███╗   ███╗██████╗  █████╗ ███╗   ██╗████████╗██╗   ██╗███╗   ██╗ ██████╗
       ██╔════╝██║  ██║╚══██╔══╝██╔══██╗██╔══██╗████╗ ████║██╔══██╗██╔══██╗████╗  ██║╚══██╔══╝██║   ██║████╗  ██║██╔════╝
       ███████╗███████║   ██║   ██████╔╝███████║██╔████╔██║██████╔╝███████║██╔██╗ ██║   ██║   ██║   ██║██╔██╗ ██║██║     
       ╚════██║██╔══██║   ██║   ██╔══██╗██╔══██║██║╚██╔╝██║██╔═══╝ ██╔══██║██║╚██╗██║   ██║   ██║   ██║██║╚██╗██║██║     
       ███████║██║  ██║   ██║   ██║  ██║██║  ██║██║ ╚═╝ ██║██║     ██║  ██║██║ ╚████║   ██║   ╚██████╔╝██║ ╚████║╚██████╗
       ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝╚═╝     ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝
    ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },

  {
    "noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },

  {
    "nvim-notify",
    opts = {
      timeout = 1500,
    },
  },

  {
    "bufferline.nvim",
    -- keys = {
    --   { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
    --   { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    -- },
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  {
    "lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.remove(opts.sections.lualine_z)
      table.insert(opts.sections.lualine_z, {
        "fileformat",
        fmt = string.upper,
        icons_enabled = false,
      })
    end,
  },

  {
    "folke/zen-mode.nvim",
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", silent = true } },
    opts = {
      window = {
        backdor = 0.8,
        width = 120,
      },
      plugins = {
        gitsings = true,
        tmux = true,
      },
    },
  },
}
