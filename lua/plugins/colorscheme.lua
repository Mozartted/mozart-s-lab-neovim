return {
  {
    "craftzdog/solarized-osaka.nvim",
    branch = "osaka",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "rebelot/kanagawa.nvim", name = "kanagawa", priority = 1000 },
  { "morhetz/gruvbox", name = "gruvbox", priority = 1000 },
  { "sainnhe/everforest", name = "everforest", priority = 1000 },
  { "raphamorim/lucario", name = "lucario", priority = 1000 },
  { "nyoom-engineering/oxocarbon.nvim", name = "oxcarbon", priority = 1000 },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nordic").load()
    end,
  },
  {
    "roobert/palette.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("palette").setup({
        palettes = {
          main = "dust_dusk",
          accent = "custom_accent_palette",
          state = "custom_state_palette",
        },

        custom_palettes = {
          main = {
            dust_dusk = {
              color0 = "#121527",
              color1 = "#1A1E39",
              color2 = "#232A4D",
              color3 = "#3E4D89",
              color4 = "#687BBA",
              color5 = "#A4B1D6",
              color6 = "#bdbfc9",
              color7 = "#DFE5F1",
              color8 = "#e9e9ed",
            },
            green_night = {
              color0 = "#121417",
              color1 = "#1A1E39",
              color2 = "#9F5662",
              color3 = "#548687", -- Keywords and Lines
              -- color3 = "#D9AE7E", -- Keywords and Lines
              color4 = "#7b7f94",
              color5 = "#aea4bf", -- Objects keys  and items
              color6 = "#bdbfc9", -- Symbols and Operators
              color7 = "#FF8D85", -- Functions
              color8 = "#73A580", -- Variables
              -- color9 = "#fa824c", -- Variables
            },
            -- custom_main_palette = {
            --    color0 = "#191d33",
            --    color1 = "#1A1E39",
            --    color2 = "#383f5e",
            --    color3 = "#4e5470",
            --    color4 = "#7b7f94",
            --    color5 = "#a7a9b7",
            --    color6 = "#bdbfc9",
            --    color7 = "#d3d4db",
            --    color8 = "#e9e9ed",
            --  },
            --
          },
          accent = {
            custom_accent_palette = {
              accent0 = "#D97C8F",
              accent1 = "#D9AE7E",
              accent2 = "#D9D87E",
              accent3 = "#A5D9A7",
              accent4 = "#8BB9C8",
              accent5 = "#C9A1D3",
              accent6 = "#B8A1D9",
            },
          },
          state = {
            custom_state_palette = {
              error = "#D97C8F",
              warning = "#D9AE7E",
              hint = "#D9D87E",
              ok = "#A5D9A7",
              info = "#8BB9C8",
            },
          },
        },
      })

      -- vim.cmd([[colorscheme palette]])
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },
}
