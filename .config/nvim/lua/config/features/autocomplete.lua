local M = {}

local MIN_CHARS = 2

vim.opt.pumheight = 6
vim.opt.complete = { ".", "w", "b", "u" }
vim.opt.completeopt = { "menuone", "noselect", "popup", "fuzzy" }

local last_char = nil

local function feed(keys)
  vim.api.nvim_feedkeys(
    vim.api.nvim_replace_termcodes(keys, true, false, true),
    "n",
    false
  )
end

local function get_word_before_cursor()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2]

  return line:sub(1, col):match("[%w_]+$")
end

local function should_complete()
  if vim.fn.mode() ~= "i" then
    return false
  end

  if vim.fn.pumvisible() == 1 then
    return false
  end

  if vim.fn.reg_recording() ~= "" or vim.fn.reg_executing() ~= "" then
    return false
  end

  -- Only trigger after normal typed word chars.
  -- Backspace/delete won't set this to a word char.
  if not last_char or not last_char:match("[%w_]") then
    return false
  end

  local word = get_word_before_cursor()

  return word ~= nil and #word >= MIN_CHARS
end

function M.trigger()
  vim.schedule(function()
    if should_complete() then
      feed("<C-n>")
    end

    last_char = nil
  end)
end

local group = vim.api.nvim_create_augroup("native_autocomplete", {
  clear = true,
})

vim.api.nvim_create_autocmd("InsertCharPre", {
  group = group,
  callback = function()
    last_char = vim.v.char
    M.trigger()
  end,
})

vim.keymap.set("i", "<Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"
  end

  return "<Tab>"
end, {
  expr = true,
  desc = "Next completion item",
})

vim.keymap.set("i", "<S-Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-p>"
  end

  return "<S-Tab>"
end, {
  expr = true,
  desc = "Previous completion item",
})

vim.keymap.set("i", "<CR>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-y>"
  end

  return "<CR>"
end, {
  expr = true,
  desc = "Confirm completion",
})

return M
