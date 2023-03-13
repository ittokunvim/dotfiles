return {

  -- Starter
  {
    "echasnovski/mini.starter",
    version = false,
    opts = function()
      local logo = table.concat({
        "III TTTTTT TTTTTT  OOO  K  K U   U N   N",
        " I    TT     TT   O   O K K  U   U NN  N",
        " I    TT     TT   O   O KK   U   U N N N",
        " I    TT     TT   O   O K K  U   U N  NN",
        "III   TT     TT    OOO  K  K  UUU  N   N",
      }, "\n")
      local new_section = function(name, action, section)
        return { name = name, action = action, section = section }
      end

      return {
        autoopen = true,
        header = logo,
        items = {
          new_section("Find file", "Telescope find_files", "Telescope"),
          new_section("Grep text", "Telescope live_grep",  "Telescope"),
          new_section("Lazy",      "Lazy",                 "Config"),
          new_section("Mason",     "Mason",                "Config"),
          new_section("init.lua",  "e $MYVIMRC",           "Config"),
          new_section("Quit",      "qa",                   "Builtin"),
        },
        footer = [[Plugin Keymaps

noremap                             │ inoremap
  <leader>sut - StartupTime         │ gc    - Comment
  <leader>mdp - MarkdownPreview     │ <C-p> - LspCmp Select Prev
  <leader>s   - Lspsaga             │ <C-n> - LspCmp Select Next
  <leader>e   - Neotree             │ <C-l> - LspCmp Complete
  <leader>f   - Telescope           │ <C-e> - LspCmp Abort
  <leader>b   - Bufferline (barbar) │ <CR>  - LspCmp Confirm
                                    │ <tab> - LuaSnip
      ]],
      }
    end,
    config = function(plugin, opts)
      require("mini.starter").setup(opts)
    end,
  },

  -- Indent Line
  {
    "echasnovski/mini.indentscope",
    opts = {
      draw = {
        delay = 100,
      },
      symbol = "│",
    },
    config = function(plugin, opts)
      require("mini.indentscope").setup(opts)
    end
  },

  -- Tab Line
  {
    "romgrk/barbar.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>b[", "<cmd>BufferPrevious<cr>", desc = "Tab Prev" },
      { "<leader>b]", "<cmd>BufferNext<cr>", desc = "Tab Next" },
      { "<leader>bc", "<cmd>BufferClose<cr>", desc = "Tab Close" },
      { "<leader>bp", "<cmd>BufferPin<cr>", desc = "Tab Pin" },
    },
    opts = {
      animation = true,
      auto_hide = true,
      tabpages = true,
      closable = true,
      clickable = true,
      highlight_inactive_file_icons = true,
      highlight_visible = true,
      icons = true,
      icon_custom_colors = true,
      icon_pinned = ''
    },
    config = function(plugin, opts)
      require("bufferline").setup(opts)
    end
  },

  -- Winbar
  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {}
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      options = {
        theme = "tokyonight",
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
    },
    config = function(plugins, opts)
      require("lualine").setup(opts)
    end
  },
}
