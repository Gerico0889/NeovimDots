return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = function()
      local shell = vim.o.shell
      if vim.fn.filereadable("/.dockerenv") == 1 or vim.fn.match(vim.fn.system("cat /proc/1/cgroup"), "docker") ~= -1 then
        shell = "/usr/bin/fish"
      end
      return {
        size = 20,
        open_mapping = [[<c-\>]],
        direction = "horizontal",
        shell = shell,
      }
    end,
  },
}
