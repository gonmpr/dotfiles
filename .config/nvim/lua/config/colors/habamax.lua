-- Habamax colors
--'#1c1c1c', '#af5f5f', '#5faf5f', 
--'#af875f', '#5f87af', '#af87af', 
--'#5f8787', '#9e9e9e', '#767676', 
--'#d75f87', '#87d787', '#d7af87', 
--'#5fafd7', '#d787d7', '#87afaf', 
--'#bcbcbc'
-- black can also be 252525 for better constrast

local M = {}

M.palette = {
  black         = "#1c1c1c",
  red           = "#af5f5f",
  green         = "#5faf5f",
  yellow        = "#af875f",
  blue          = "#5f87af",
  purple        = "#af87af",
  cyan          = "#5f8787",
  white         = "#bcbcbc",

  bright_black  = "#767676",
  bright_red    = "#d75f87",
  bright_green  = "#87d787",
  bright_yellow = "#d7af87",
  bright_blue   = "#5fafd7",
  bright_purple = "#d787d7",
  bright_cyan   = "#87afaf",
  bright_white  = "#bcbcbc",

  gray          = "#767676",

  -- Softer syntax colors
  syntax_blue   = "#6f91b6",
  syntax_cyan   = "#6f9c9c",
  syntax_green  = "#7aa36f",
  syntax_purple = "#a184a8",
  syntax_orange = "#b08a64",
  syntax_gray   = "#8a8a8a",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.setup()
  local p = M.palette

  -- =========================
  -- Editor UI
  -- =========================

  hl("NormalFloat", { bg = "NONE" })
  hl("FloatBorder", { fg = p.gray, bg = "NONE" })

  hl("MatchParen", { fg = p.bright_white, bg = "NONE", bold = true })
  hl("CursorLine", { bg = "#1e1e1e" })
  hl("NonText", { fg = "#1e1e1e" })

  hl("Visual", { bg = "#303030" })

  hl("Search", { fg = p.black, bg = p.yellow })
  hl("IncSearch", { fg = p.black, bg = p.bright_yellow })

  hl("Error", { fg = p.bright_red, bold = true })
  hl("ErrorMsg", { fg = p.bright_red, bold = true })
  hl("WarningMsg", { fg = p.bright_yellow, bold = true })

  -- =========================
  -- Syntax: noticeable but muted
  -- =========================

  -- Comments
  hl("Comment", { fg = p.bright_black, italic = true })

  -- Strings
  hl("String", { fg = p.syntax_green })
  hl("Character", { fg = p.syntax_green })

  -- Numbers / constants
  hl("Number", { fg = p.syntax_orange })
  hl("Boolean", { fg = p.syntax_orange })
  hl("Float", { fg = p.syntax_orange })
  hl("Constant", { fg = p.syntax_orange })

  -- Variables / identifiers
  hl("Identifier", { fg = p.white })

  -- Functions
  hl("Function", { fg = p.syntax_blue, bold = true })
  hl("FunctionCall", { fg = p.syntax_blue })

  -- Control flow / keywords:
  -- if, else, for, while, return, break, continue, switch, etc.
  hl("Statement", { fg = p.syntax_purple })
  hl("Conditional", { fg = p.syntax_purple })
  hl("Repeat", { fg = p.syntax_purple })
  hl("Label", { fg = p.syntax_purple })
  hl("Keyword", { fg = p.syntax_purple })

  -- Operators / delimiters
  hl("Operator", { fg = p.syntax_gray })
  hl("Delimiter", { fg = p.syntax_gray })

  -- Preprocessor / macros
  hl("PreProc", { fg = p.syntax_orange })
  hl("Include", { fg = p.syntax_orange })
  hl("Define", { fg = p.syntax_orange })
  hl("Macro", { fg = p.syntax_orange })

  -- Types
  hl("Type", { fg = p.syntax_cyan })
  hl("StorageClass", { fg = p.syntax_cyan })
  hl("Structure", { fg = p.syntax_cyan })
  hl("Typedef", { fg = p.syntax_cyan })

  -- Special symbols / escape sequences
  hl("Special", { fg = p.syntax_cyan })
  hl("SpecialChar", { fg = p.syntax_cyan })

  -- =========================
  -- Popup menu / completion
  -- =========================

  hl("Pmenu", { fg = p.white, bg = "#252525" })
  hl("PmenuSel", { fg = p.black, bg = p.syntax_blue })
  hl("PmenuSbar", { bg = "#303030" })
  hl("PmenuThumb", { bg = p.gray })

  -- =========================
  -- Statusline groups
  -- =========================

  hl("StatusNorm", { fg = p.black, bg = p.black })

  hl("StatusLineNum", { fg = p.black, bg = p.yellow })
  hl("StatusType", { fg = p.black, bg = p.white })
  hl("StatusPercent", { fg = p.black, bg = p.white })
  hl("StatusBuffer", { fg = p.cyan, bg = p.black })

  hl("StatusModeNorm", { fg = p.black, bg = p.yellow })
  hl("StatusModeInsert", { fg = p.black, bg = p.green })
  hl("StatusModeVisual", { fg = p.black, bg = p.purple })
  hl("StatusModeReplace", { fg = p.black, bg = p.red })
  hl("StatusModeCommand", { fg = p.black, bg = p.blue })
  hl("StatusModeTerm", { fg = p.black, bg = p.bright_white })
end

return M

