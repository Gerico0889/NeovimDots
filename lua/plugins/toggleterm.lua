return {
  {
    "akinsho/toggleterm.nvim",
    version = "*", -- Optional: lock to a specific version if needed
    config = function()
      local shell = vim.o.shell
      local is_docker = vim.fn.filereadable("/.dockerenv") == 1
        or vim.fn.match(vim.fn.system("cat /proc/1/cgroup"), "docker") ~= -1
      if is_docker then
        shell = "/usr/bin/fish"
      end

      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<c-\>]],
        direction = "horizontal",
        shell = shell,
      })
    end,
  },
}
