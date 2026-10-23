-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Slit window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G", opts)

-- Buffer switching with Ctrl+Shift+H and Ctrl+Shift+L
for _, key in ipairs({ "<C-S-h>", "<C-S-H>" }) do
  keymap.set("n", key, function()
    if not pcall(vim.cmd, "BufferLineCyclePrev") then
      vim.cmd("bprevious")
    end
  end, { desc = "Prev Buffer", silent = true })
  keymap.set(
    "t",
    key,
    "<C-\\><C-n><cmd>lua if not pcall(vim.cmd, [[BufferLineCyclePrev]]) then vim.cmd([[bprevious]]) end<cr>",
    { desc = "Prev Buffer", silent = true }
  )
end

for _, key in ipairs({ "<C-S-l>", "<C-S-L>" }) do
  keymap.set("n", key, function()
    if not pcall(vim.cmd, "BufferLineCycleNext") then
      vim.cmd("bnext")
    end
  end, { desc = "Next Buffer", silent = true })
  keymap.set(
    "t",
    key,
    "<C-\\><C-n><cmd>lua if not pcall(vim.cmd, [[BufferLineCycleNext]]) then vim.cmd([[bnext]]) end<cr>",
    { desc = "Next Buffer", silent = true }
  )
end
