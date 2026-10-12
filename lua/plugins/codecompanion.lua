return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "zbirenbaum/copilot.lua",
    },
    config = function()
      require("copilot").setup({})
      require("codecompanion").setup({
        adapters = {
          copilot = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = { model = { default = "gpt-4o" } },
            })
          end,
        },
        strategies = {
          chat = { adapter = "copilot" },
          inline = { adapter = "copilot" },
        },
      })
    end,
  },
}
