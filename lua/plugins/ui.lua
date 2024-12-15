return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.presets.lsp_doc_border = true
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
    end,
  },
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          --           header = [[
          --
          -- ███╗   ███╗ ██████╗ ███████╗ █████╗ ██████╗ ████████╗███████╗    ██╗      █████╗ ██████╗
          -- ████╗ ████║██╔═══██╗╚══███╔╝██╔══██╗██╔══██╗╚══██╔══╝██╔════╝    ██║     ██╔══██╗██╔══██╗
          -- ██╔████╔██║██║   ██║  ███╔╝ ███████║██████╔╝   ██║   ███████╗    ██║     ███████║██████╔╝
          -- ██║╚██╔╝██║██║   ██║ ███╔╝  ██╔══██║██╔══██╗   ██║   ╚════██║    ██║     ██╔══██║██╔══██╗
          -- ██║ ╚═╝ ██║╚██████╔╝███████╗██║  ██║██║  ██║   ██║   ███████║    ███████╗██║  ██║██████╔╝
          -- ╚═╝     ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝    ╚══════╝╚═╝  ╚═╝╚═════╝
          --
          -- ]],

          header = [[

888b     d888                                   888    d8b              888               888      
8888b   d8888                                   888    88P              888               888      
88888b.d88888                                   888    8P               888               888      
888Y88888P888  .d88b. 88888888  8888b.  888d888 888888 "  .d8888b       888       8888b.  88888b.  
888 Y888P 888 d88""88b   d88P      "88b 888P"   888       88K           888          "88b 888 "88b 
888  Y8P  888 888  888  d88P   .d888888 888     888       "Y8888b.      888      .d888888 888  888 
888   "   888 Y88..88P d88P    888  888 888     Y88b.          X88      888      888  888 888 d88P 
888       888  "Y88P" 88888888 "Y888888 888      "Y888     88888P'      88888888 "Y888888 88888P"  
                                                                                                   
                                                                                                   
                                                                                                   
]],

        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = "⚙ ", key = "m", desc = "Mason", action = ":Mason" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        },
        sections = {
          { section = "header" },
          {
            pane = 2,
            height = 9,
            padding = 13,
            -- section = "terminal",
            -- cmd = "colorscript -e square",
            -- height = 5,
            -- padding = 1,
          },
          { pane = 1, section = "keys", gap = 1, padding = 1 },
          { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          {
            pane = 2,
            icon = " ",
            title = "Git Status",
            section = "terminal",
            enabled = vim.fn.isdirectory(".git") == 1,
            cmd = "hub status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
          -- { section = "keys", gap = 1, padding = 1 },
          {
            pane = 1,
            icon = " ",
            desc = "Browse Repo",
            padding = 1,
            key = "b",
            action = function()
              Snacks.gitbrowse()
            end,
          },
          function()
            local in_git = Snacks.git.get_root() ~= nil
            local cmds = {
              {
                title = "Notifications",
                cmd = "gh notify -s -a -n5",
                action = function()
                  vim.ui.open("https://github.com/notifications")
                end,
                key = "n",
                icon = " ",
                height = 5,
                enabled = true,
              },
              -- {
              --   title = "Open Issues",
              --   cmd = "gh issue list -L 3",
              --   key = "i",
              --   action = function()
              --     vim.fn.jobstart("gh issue list --web", { detach = true })
              --   end,
              --   icon = " ",
              --   height = 7,
              -- },
              {
                icon = " ",
                title = "Open PRs",
                cmd = "gh pr list -L 3",
                key = "p",
                action = function()
                  vim.fn.jobstart("gh pr list --web", { detach = true })
                end,
                height = 7,
              },
              -- {
              --   icon = " ",
              --   title = "Git Status",
              --   cmd = "hub --no-pager diff --stat -B -M -C",
              --   height = 10,
              -- },
            }
            return vim.tbl_map(function(cmd)
              return vim.tbl_extend("force", {
                pane = 2,
                section = "terminal",
                enabled = in_git,
                padding = 1,
                ttl = 5 * 60,
                indent = 3,
              }, cmd)
            end, cmds)
          end,
          { section = "startup" },
        },
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 10000,
    },
  },
}
