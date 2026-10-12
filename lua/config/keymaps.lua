local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Window navigation and splits
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus left" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus right" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus down" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus up" })

map("n", "<leader>ws", "<C-w>s", { desc = "Split window down" })
map("n", "<leader>wv", "<C-w>v", { desc = "Split window right" })
map("n", "<leader>-", "<C-w>s", { desc = "Split window down" })
map("n", "<leader>|", "<C-w>v", { desc = "Split window right" })
map("n", "<leader>wc", "<C-w>c", { desc = "Close window" })
map("n", "<leader>wd", "<C-w>c", { desc = "Close window" })

-- Diagnostics
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "[e", vim.diagnostic.goto_prev, { desc = "Previous error" })
map("n", "]e", vim.diagnostic.goto_next, { desc = "Next error" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" })
map("n", "<leader>sd", vim.diagnostic.setloclist, { desc = "Open diagnostics" })

-- Buffers
for i = 1, 9 do
  map("n", "<leader>" .. i, function()
    require("bufferline").go_to_buffer(i, true)
  end, { desc = "Buffer " .. i })
end
map("n", "<leader>0", "<cmd>b#<cr>", { desc = "Alternate buffer" })
map("n", "<leader>bb", "<cmd>b#<cr>", { desc = "Alternate buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close buffer" })
map("n", "<leader>bD", function()
  require("bufferline").close_with_pick()
end, { desc = "Pick buffer to close" })
map("n", "<leader>bq", "<cmd>%bdelete|edit #|normal `<cr>", { desc = "Close inactive buffers" })
map("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New file" })
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<leader>,", "<cmd>BufferLinePick<cr>", { desc = "Buffer switcher" })

-- Sidebar
map("n", "<leader>e", "<cmd>Neotree toggle filesystem left<cr>", { desc = "File explorer" })
map("n", "<leader>b", "<cmd>Neotree toggle buffers left<cr>", { desc = "Buffer tree" })
map("n", "-", "<cmd>Neotree toggle filesystem left dir=%:p:h<cr>", { desc = "File tree at current file" })

-- Terminal
map("n", "<leader>t", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Terminal" })
map("n", "<C-/>", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Terminal" })

-- AI
map({ "n", "v" }, "<leader>aa", "<cmd>CodeCompanionChat<cr>", { desc = "AI chat" })
map({ "n", "v" }, "<leader>ae", "<cmd>CodeCompanionInline<cr>", { desc = "Inline assist" })
map({ "n", "v" }, "<C-\\>", "<cmd>CodeCompanionChat<cr>", { desc = "AI chat" })

-- Git
map("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Lazygit" })
map("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Git blame" })
map("n", "]h", "<cmd>Gitsigns next_hunk<cr>", { desc = "Next hunk" })
map("n", "[h", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Previous hunk" })
map("n", "<leader>ghd", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Preview hunk" })
map("n", "<leader>ghr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Reset hunk" })
map("n", "<leader>ghR", "<cmd>Gitsigns reset_buffer<cr>", { desc = "Reset buffer" })

-- LSP
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
map("n", "gI", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format" })
map("n", "<leader>ch", function()
  vim.lsp.buf_request(0, "textDocument/switchSourceHeader", { uri = vim.uri_from_bufnr(0) }, function(err, result)
    if err then
      vim.notify(err.message, vim.log.levels.ERROR)
    elseif result then
      vim.cmd("edit " .. vim.uri_to_fname(result))
    else
      vim.notify("No corresponding file", vim.log.levels.WARN)
    end
  end)
end, { desc = "Switch source/header" })
map("n", "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "Document symbols" })
map("n", "<leader>ui", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

-- Search
map("n", "<leader><space>", "<cmd>FzfLua files<cr>", { desc = "Find files" })
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Find files" })
map("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>", { desc = "Live grep" })
map("n", "<leader>/", "<cmd>FzfLua live_grep<cr>", { desc = "Search workspace" })
map("n", "<leader>sg", "<cmd>FzfLua live_grep<cr>", { desc = "Search workspace" })
map("n", "<leader>sw", "<cmd>FzfLua grep_cword<cr>", { desc = "Search word" })
map("n", "<leader>sb", "<cmd>FzfLua buffers<cr>", { desc = "Search buffers" })
map("n", "<leader>fh", "<cmd>FzfLua help_tags<cr>", { desc = "Find help" })
map("n", "<leader>fp", "<cmd>FzfLua oldfiles<cr>", { desc = "Recent files" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New file" })

-- Build / run
map("n", "<leader>mb", "<cmd>CMakeBuild<cr>", { desc = "Build" })
map("n", "<leader>mr", "<cmd>CMakeRun<cr>", { desc = "Run" })
map("n", "<leader>mg", "<cmd>CMakeGenerate<cr>", { desc = "Generate" })
map("n", "<leader>md", "<cmd>CMakeDebug<cr>", { desc = "Debug" })

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit" })

-- Visual move lines
map("v", "<S-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<S-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Centered navigation
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "G", "Gzz")

-- Flash
map({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })
map({ "n", "x", "o" }, "S", function()
  require("flash").jump({ search = { forward = false } })
end, { desc = "Flash backward" })

-- Project-specific
map("n", "<leader>mc", "<cmd>edit /source/Machine/config/01-custom-config.properties<cr>", { desc = "Open config file" })
