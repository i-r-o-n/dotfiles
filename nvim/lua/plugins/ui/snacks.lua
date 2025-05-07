return {
  "folke/snacks.nvim",
  ---@type snacks.Config
  opts = {
    dashboard = {
      preset = {
        header = {
          [[
                        .,-:;//;:=,
                    . :H@@@MM@M#H/.,+%;,
                 ,/X+ +M@@M@MM%=,-%HMMM@X/,
               -+@MM; $M@@MH+-,;XMMMM@MMMM@+-
              ;@M@@M- XM@X;. -+XXXXXHHH@M@M#@/.
            ,%MM@@MH ,@%=             .---=-=:=,.
            =@#@@@MX.,                -%HX$$%%%:;
           =-./@M@M$                   .;@MMMM@MM:
           X@/ -$MM/                    . +MM@@@M$
          ,@M@H: :@:                    . =X#@@@@-
          ,@@@MMX, .                    /H- ;@M@M=
          @@@@M@+,                      %MM+..%#$.
           /MMMM@MMH/.                  XM@MH; =;
            /%+%$XHH@$=              , .H@@@@MX,
             .=--------.           -%H.,@@@@@MX,
             .%MM@@@HHHXX$$$%+- .:$MMX =M@@MM%.
               =XMMM@MM@MM#H;,-+HMM@M+ /MMMX=
                 =%@M@M#@$-.=$@MM@@@M; %M%=
                   ,:+$+-,/H#MMMMMMM@= =,
                         =++%%%%+/:-.]],
        },
      },
      keys = {
        {
          icon = " ",
          key = "f",
          desc = "find file",
          action = ":lua Snacks.dashboard.pick('files')",
          hl = "SnacksDashboardNormal",
        },
        { icon = " ", key = "n", desc = "new file", action = ":ene | startinsert" },
        { icon = " ", key = "g", desc = "find text", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { icon = " ", key = "r", desc = "recent files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        {
          icon = " ",
          key = "c",
          desc = "config",
          action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
        },
        { icon = " ", key = "s", desc = "restore session", section = "session" },
        -- { icon = " ", key = "x", desc = "lazy extras", action = ":LazyExtras" },
        { icon = "󰒲 ", key = "l", desc = "lazy", action = ":Lazy" },
        { icon = " ", key = "q", desc = "quit", action = ":qa" },
      },
      sections = {
        { section = "header" },
        {
          pane = 2,
          section = "terminal",
          cmd = "cbonsai -li -w 1 -L 20 -b 2",
          height = 20,
          padding = 1,
        },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "recent files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "git status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },
    },
  },
  -- init = function()
  --   vim.api.nvim_set_hl(0, "SnacksDashboardNormal", { fg = "#f79a04" })
  -- end,
}
