-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")
local map = vim.keymap.set

-- Add more subcategories here
wk.add({
  { "<leader>m", group = "Machine GUI" },
})

-- Edif Machine GUI arguments and ask for Machine Type and Resolution
function RunWithArgs()
  local machine_type = vim.fn.input("Enter the Machine Type (default: M8): ")
  if machine_type == "" then
    machine_type = "M8"
  end

  local resolution = vim.fn.input("Enter the RESOLUTION (default: 800x600): ")
  if resolution == "" then
    resolution = "800x600"
  end

  -- Define the GUI_ARGS with placeholders for MACHINE_TYPE and RESOLUTION
  local gui_args = "-fake-service-technician -fake-ws -fake-uc -fake-coach -fake-usermanager "
    .. "-no-check-certificate -view-src-path -fake-rfid -mouse-cursor -log-colors "
    .. "-vv -fallback-machine-id 195 -fallback-machine-wsse-password eb26d4c5-f91d-4a80-9fd9-dee609f63906 "
    .. "-fake-device-config -fallback-machine-type "
    .. machine_type
    .. " -gui-resolution "
    .. resolution

  vim.cmd("CMakeLaunchArgs " .. gui_args)
end

map(
  "n",
  "<leader>fg",
  ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
  { desc = "Live Grep with Arguments" }
)
map("n", "<leader>mb", ":CMakeBuild<CR>", { desc = "Build Machine GUI" })
map("n", "<leader>mc", ":lua RunWithArgs()<CR>", { desc = "Change Machine GUI Params", silent = true })
map("n", "<leader>mt", ":CMakeSelectLaunchTarget<CR>", { desc = "Select target" })
map("n", "<leader>mr", ":CMakeRun<CR>", { desc = "Run Machine GUI" })
