-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")
local map = vim.keymap.set

-- Add more subcategories here
wk.add({
  { "<leader>m", group = "Machine GUI" },
})

-- Open custom config file
function OpenCustomConfig()
  local config_path = "/source/Machine/config/01-custom-config.properties"
  vim.cmd("edit " .. config_path)
end

map("n", "<leader>mc", ":lua OpenCustomConfig()<CR>", { desc = "Open Config File" })
