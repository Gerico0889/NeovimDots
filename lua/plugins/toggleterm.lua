return {
  {
    "akinsho/toggleterm.nvim",
    version = "*", -- Optional: lock to a specific version if needed
    config = function()
      require("toggleterm").setup({
        -- Your configuration options here
        size = 20,
        open_mapping = [[<c-\>]],
        direction = "horizontal",
      })
    end,
  },
}
