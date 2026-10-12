return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        mode = "buffers",
        numbers = "ordinal",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        diagnostics = "nvim_lsp",
        offsets = {
          { filetype = "neo-tree", text = "Explorer", highlight = "Directory", separator = true },
        },
        show_close_icon = false,
        separator_style = "thin",
        always_show_bufferline = true,
        sort_by = "insert_after_current",
      },
    },
  },
}
