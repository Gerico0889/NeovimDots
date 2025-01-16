return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui", -- UI for nvim-dap
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text", -- Virtual text for inline debug info
    },
    config = function()
      -- Setup nvim-dap
      local dap = require("dap")
      local dapui = require("dapui")

      -- Set up DAP UI
      dapui.setup()
      require("nvim-dap-virtual-text").setup()

      -- Keymaps for debugging
      vim.keymap.set("n", "<F5>", function()
        dap.continue()
      end, { desc = "Start/Continue Debugging" })
      vim.keymap.set("n", "<F10>", function()
        dap.step_over()
      end, { desc = "Step Over" })
      vim.keymap.set("n", "<F11>", function()
        dap.step_into()
      end, { desc = "Step Into" })
      vim.keymap.set("n", "<F12>", function()
        dap.step_out()
      end, { desc = "Step Out" })
      vim.keymap.set("n", "<Leader>db", function()
        dap.toggle_breakpoint()
      end, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<Leader>dr", function()
        dap.repl.open()
      end, { desc = "Open REPL" })
      vim.keymap.set("n", "<Leader>du", function()
        dapui.toggle()
      end, { desc = "Toggle DAP UI" })

      -- Configure C++ adapter
      dap.adapters.cppdbg = {
        id = "cppdbg",
        type = "executable",
        command = "/opt/cpptools-linux/debugAdapters/bin/OpenDebugAD7", -- Path inside the container
      }

      -- DAP configuration for C++ (and C)
      dap.configurations.cpp = {
        {
          name = "Launch with Make",
          type = "cppdbg",
          request = "launch",
          program = function()
            vim.fn.jobstart({ "make", "debug" })
            return nil -- No need to provide a binary path here
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      dap.configurations.c = dap.configurations.cpp -- Use the same config for C
    end,
  },
}
