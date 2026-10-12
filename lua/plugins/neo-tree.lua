return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      close_if_last_window = false,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
      default_component_configs = {
        indent = { with_expanders = true, expander_collapsed = "", expander_expanded = "" },
        modified = { symbol = "●" },
        git_status = {
          symbols = {
            added = "+",
            modified = "~",
            deleted = "",
            renamed = "➜",
            untracked = "★",
            staged = "S",
          },
        },
      },
      window = {
        position = "left",
        width = 40,
        mappings = {
          ["<space>"] = "none",
          ["P"] = { "toggle_preview", config = { use_float = true } },
        },
      },
      filesystem = {
        filtered_items = { visible = true },
        follow_current_file = { enabled = true, leave_dirs_open = false },
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
      },
      buffers = {
        follow_current_file = { enabled = true, leave_dirs_open = false },
        group_empty_dirs = true,
        show_unloaded = true,
      },
      source_selector = {
        winbar = true,
        sources = {
          { source = "filesystem", display_name = "  Files " },
          { source = "buffers", display_name = "  Buffers " },
          { source = "git_status", display_name = "  Git " },
        },
      },
    },
  },
}
