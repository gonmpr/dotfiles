local palette = require("config.colors.habamax").palette

vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = palette.gray, bg = "NONE" })

local M = {}

local function normalize_path(path)
  if not path or path == "" then
    return nil
  end

  path = path:gsub("^%./", "")

  return path
end

local function open_floating_window()
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.6)

  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local buf = vim.api.nvim_create_buf(false, true)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  })

  vim.bo[buf].bufhidden = "wipe"
  vim.bo[buf].swapfile = false
  vim.bo[buf].buflisted = false

  return buf, win
end

local function file_command()
  return [[
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
      git ls-files --cached --others --exclude-standard
    else
      find . -type f \
        -not -path '*/.git/*' \
        -not -path '*/__pycache__/*' \
        -not -path '*/node_modules/*' \
        -not -path '*/build/*' \
        -not -path '*/dist/*'
    fi
  ]]
end

local function create_parent_dirs(file)
  local dir = vim.fn.fnamemodify(file, ":h")

  if dir ~= "." and vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, "p")
  end
end

function M.find()
  if vim.fn.executable("fzf") == 0 then
    vim.notify("fzf not found", vim.log.levels.ERROR)
    return
  end

  local _, win = open_floating_window()
  local tmpfile = vim.fn.tempname()

  local cmd = string.format(
    "FZF_DEFAULT_COMMAND=%s fzf --print-query > %s",
    vim.fn.shellescape(file_command()),
    vim.fn.shellescape(tmpfile)
  )

  vim.fn.termopen({ "sh", "-c", cmd }, {
    on_exit = function()
      pcall(vim.api.nvim_win_close, win, true)

      local lines = vim.fn.readfile(tmpfile)
      vim.fn.delete(tmpfile)

      if #lines == 0 then
        return
      end

      local query = normalize_path(lines[1])
      local file = normalize_path(lines[2]) or query

      if not file or file == "" then
        return
      end

      create_parent_dirs(file)

      vim.cmd.edit(vim.fn.fnameescape(file))
    end,
  })

  vim.cmd.startinsert()
end

vim.keymap.set("n", "<leader>f", M.find, {
  desc = "Find or create file",
})

return M
