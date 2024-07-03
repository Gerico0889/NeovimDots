vim.cmd("let g:airline_powerline_fonts = 1")

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Setup args for live-grep
local lga_actions = require("telescope-live-grep-args.actions")
require("telescope").setup({
  extensions = {
    live_grep_args = {
      auto_quoting = true, -- enable/disable auto-quoting
      -- define mappings, e.g.
      mappings = { -- extend mappings
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
      -- ... also accepts theme settings, for example:
      -- theme = "dropdown", -- use dropdown theme
      -- theme = { }, -- use own theme spec
      -- layout_config = { mirror=true }, -- mirror preview pane
    },
  },
})
