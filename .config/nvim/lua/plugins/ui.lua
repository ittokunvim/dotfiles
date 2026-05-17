return {
  -- Starter
  {
    "echasnovski/mini.starter",
    version = false,
    opts = function()
      local logo = table.concat({
        "III TTTTTT TTTTTT  OOO  K  K U   U N   N V     V III M   M",
        " I    TT     TT   O   O K K  U   U NN  N V     V  I  MM MM",
        " I    TT     TT   O   O KK   U   U N N N  V   V   I  M M M",
        " I    TT     TT   O   O K K  U   U N  NN   V V    I  M   M",
        "III   TT     TT    OOO  K  K  UUU  N   N    V    III M   M",
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

noremap                      │ inoremap
  ;sut - StartupTime         │ gc    - Comment
  ;mdp - MarkdownPreview     │ <C-p> - LspCmp Select Prev
  ;s   - Lspsaga             │ <C-n> - LspCmp Select Next
  ;e   - Neotree             │ <C-l> - LspCmp Complete
  ;f   - Telescope           │ <C-e> - LspCmp Abort
  ;b   - Bufferline (barbar) │ <CR>  - LspCmp Confirm
  ;lf  - LspFormat           │ <tab> - LuaSnip
      ]],
      }
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
  },
  -- Tab Line
  {
    "romgrk/barbar.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { ";b[", "<cmd>BufferPrevious<cr>", desc = "Tab Prev" },
      { ";b]", "<cmd>BufferNext<cr>",     desc = "Tab Next" },
      { ";bc", "<cmd>BufferClose<cr>",    desc = "Tab Close" },
      { ";bp", "<cmd>BufferPin<cr>",      desc = "Tab Pin" },
    },
    opts = {
      animation = true,
      auto_hide = true,
      tabpages = true,
      clickable = true,
      highlight_inactive_file_icons = true,
      highlight_visible = true,
      icons = {
        filetype = {
          custom_colors = true,
          enabled = true
        },
        pinned = { button = "", filename = true },
      },
    },
  },
  -- Winbar
  {
    "utilyre/barbecue.nvim",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
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
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    },
  },
  "folke/drop.nvim",
  opts = {
    theme = "stars", -- when auto, it will choose a theme based on the date
    themes = {
      { theme = "new_year", month = 1, day = 1 },
      { theme = "valentines_day", month = 2, day = 14 },
      { theme = "st_patricks_day", month = 3, day = 17 },
      { theme = "easter", holiday = "easter" },
      { theme = "april_fools", month = 4, day = 1 },
      { theme = "us_independence_day", month = 7, day = 4 },
      { theme = "halloween", month = 10, day = 31 },
      { theme = "us_thanksgiving", holiday = "us_thanksgiving" },
      { theme = "xmas", from = { month = 12, day = 24 }, to = { month = 12, day = 25 } },
      { theme = "leaves", from = { month = 9, day = 22 }, to = { month = 12, day = 20 } },
      { theme = "snow", from = { month = 12, day = 21 }, to = { month = 3, day = 19 } },
      { theme = "spring", from = { month = 3, day = 20 }, to = { month = 6, day = 20 } },
      { theme = "summer", from = { month = 6, day = 21 }, to = { month = 9, day = 21 } },
    },
    max = 20, -- maximum number of drops on the screen
    interval = 100, -- every 150ms we update the drops
    screensaver = 1000 * 60 * 5, -- show after 5 minutes. Set to false, to disable
    filetypes = { "dashboard", "alpha", "ministarter" }, -- will enable/disable automatically for the following filetypes
    winblend = 100, -- winblend for the drop window
  },
  -- focus window
  "levouh/tint.nvim",
  opts = {},
}
