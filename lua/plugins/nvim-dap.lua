return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "--interpreter=dap", "--eval-command", "set mi-async on" },
      }

      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtEntry = false,
        },
      }

      vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug continue" })
      vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Debug step over" })
      vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Debug step into" })
      vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Debug step out" })
      vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
      vim.keymap.set("n", "<leader>dB", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "Conditional breakpoint" })
      vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Debug REPL" })
      vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug UI" })

      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      dap.listeners.before.event_terminated["dapui_config"] = dapui.close
      dap.listeners.before.event_exited["dapui_config"] = dapui.close
    end,
  },
}
