return {
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      cmake_command = "cmake",
      cmake_generate_options = { "-D", "CMAKE_EXPORT_COMPILE_COMMANDS=1" },
      cmake_build_directory = "build",
      cmake_soft_link_compile_commands = true,
      cmake_dap_configuration = {
        name = "Launch",
        type = "gdb",
        request = "launch",
        stopOnEntry = false,
        runInTerminal = true,
        console = "integratedTerminal",
      },
      cmake_executor = { name = "quickfix", opts = {} },
      cmake_runner = { name = "terminal", opts = {} },
    },
  },
}
