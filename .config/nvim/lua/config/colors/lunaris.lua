local M = {}

M.palette = {
  lack = "#708090",
  luster = "#deeeed",
  orange = "#ffaa88",
  yellow = "#abab77",
  green = "#789978",
  blue = "#7788AA",
  red = "#D70000",
  none = "NONE",

  black = "#000000",
  gray1 = "#080808",
  gray2 = "#191919",
  gray3 = "#2a2a2a",
  gray4 = "#444444",
  gray5 = "#555555",
  gray6 = "#7a7a7a",
  gray7 = "#aaaaaa",
  gray8 = "#cccccc",
  gray9 = "#DDDDDD",
}

M.special = {
  main_background = "#101010",
  menu_background = "#191919",
  popup_background = "#1a1a1a",

  statusline = "#101010",
  comment = "#3a3a3a",
  exception = "#505050",
  keyword = "#666666",
  param = "#8e8e8e",
  whitespace = "#202020",

  const = "#9a9a9a",
  number = "#989898",
  bool = "#949494",
  normal_nc = "#a8a8a8",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local function link(group, target)
  vim.api.nvim_set_hl(0, group, { link = target })
end

function M.setup()
  vim.o.background = "dark"
  vim.o.termguicolors = true

  if vim.g.colors_name then
    vim.cmd("highlight clear")
  end

  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  local color = M.palette
  local color_special = M.special

  -- Keep the same name 
  vim.g.colors_name = "lunaris"


  hl("Normal", { fg = color.gray8, bg = color_special.main_background })
  hl("NormalNC", { fg = color_special.normal_nc, bg = color_special.main_background })
  hl("EndOfBuffer", { fg = color_special.main_background, bg = color_special.main_background })

  hl("Whitespace", { fg = color_special.whitespace })
  hl("NonText", { fg = color_special.whitespace })
  hl("SpecialKey", { fg = color.gray4 })

  hl("LineNr", { fg = color.gray4 })
  hl("LineNrAbove", { fg = color.gray4 })
  hl("LineNrBelow", { fg = color.gray4 })
  hl("CursorLineNr", { fg = color.gray7 })

  hl("SignColumn", { fg = color.gray4, bg = color_special.main_background })
  hl("FoldColumn", { fg = color.gray4, bg = color_special.main_background })
  hl("Folded", { fg = color.gray4, bg = color.gray1 })

  hl("ColorColumn", { bg = color.gray1 })
  hl("CursorLine", { bg = color.gray2 })
  hl("CursorColumn", { bg = color.gray2 })

  hl("Visual", { fg = color.black, bg = color.gray8 })
  hl("VisualNOS", { fg = color.black, bg = color.gray8 })

  hl("Search", { fg = color.black, bg = color.lack })
  hl("IncSearch", { fg = color.black, bg = color.gray8 })
  hl("CurSearch", { fg = color.black, bg = color.gray8 })
  hl("Substitute", { fg = color.black, bg = color.gray8 })

  hl("MatchParen", { fg = color.black, bg = color.gray8 })
  hl("Directory", { fg = color.luster })
  hl("Title", { fg = color.gray5 })

  hl("NormalFloat", { fg = color.gray6, bg = color_special.popup_background })
  hl("FloatBorder", { fg = color.gray4, bg = color_special.popup_background })
  hl("FloatTitle", { fg = color.gray5, bg = color_special.popup_background })

  hl("Pmenu", { fg = color.gray6, bg = color_special.popup_background })
  hl("PmenuSel", { fg = color.black, bg = color.gray8 })
  hl("PmenuKind", { fg = color_special.const, bg = color_special.popup_background })
  hl("PmenuKindSel", { fg = color.black, bg = color.gray8 })
  hl("PmenuExtra", { fg = color.gray4, bg = color_special.popup_background })
  hl("PmenuExtraSel", { fg = color.black, bg = color.gray8 })
  hl("PmenuSbar", { bg = color.gray3 })
  hl("PmenuThumb", { bg = color.gray5 })
  hl("WildMenu", { fg = color.black, bg = color.gray8 })

  hl("WinSeparator", { fg = color.gray4, bg = color.none })
  hl("VertSplit", { fg = color.gray4, bg = color.none })

  hl("Error", { fg = color.red })
  hl("ErrorMsg", { fg = color.red })
  hl("WarningMsg", { fg = color.orange })
  hl("ModeMsg", { fg = color.gray7 })
  hl("MoreMsg", { fg = color.gray7 })
  hl("Question", { fg = color.gray7 })

  hl("Comment", { fg = color_special.comment })
  hl("SpecialComment", { fg = color_special.comment })
  hl("Ignore", { fg = color.gray4 })

  hl("Identifier", { fg = color.gray8 })
  hl("Variable", { fg = color.gray8 })

  hl("Function", { fg = color.luster })
  hl("FunctionCall", { fg = color.gray6 })

  hl("Constant", { fg = color_special.const })
  hl("Number", { fg = color_special.number })
  hl("Boolean", { fg = color_special.bool })
  hl("Float", { fg = color_special.number })

  hl("String", { fg = color.lack })
  hl("Character", { fg = color.lack })
  hl("SpecialChar", { fg = color.green })

  hl("Type", { fg = color.gray6 })
  hl("StorageClass", { fg = color.gray5 })
  hl("Structure", { fg = color.gray6 })
  hl("Typedef", { fg = color.gray7 })

  hl("Special", { fg = color.lack })
  hl("Tag", { fg = color.gray5 })
  hl("Debug", { fg = color.gray5 })

  hl("Statement", { fg = color_special.keyword })
  hl("Keyword", { fg = color_special.keyword })
  hl("Conditional", { fg = color_special.keyword })
  hl("Repeat", { fg = color_special.keyword })
  hl("Label", { fg = color_special.keyword })
  hl("Exception", { fg = color_special.exception })

  hl("Operator", { fg = color.gray6 })
  hl("Delimiter", { fg = color.gray6 })

  hl("PreProc", { fg = color.gray5 })
  hl("Include", { fg = color.gray5 })
  hl("Define", { fg = color.gray5 })
  hl("Macro", { fg = color.gray5 })
  hl("PreCondit", { fg = color.gray5 })

  hl("Todo", { fg = color.black, bg = color.gray8 })
  hl("Underlined", { fg = color.luster, underline = true })

  -- =========================
  -- Diagnostics / logs
  -- =========================

  hl("DiagnosticError", { fg = color.red })
  hl("DiagnosticWarn", { fg = color.orange })
  hl("DiagnosticInfo", { fg = color.gray5 })
  hl("DiagnosticHint", { fg = color.gray5 })
  hl("DiagnosticOk", { fg = color.green })
  hl("DiagnosticUnnecessary", { fg = color.gray4 })
  hl("DiagnosticDeprecated", { fg = color.orange, strikethrough = true })

  hl("DiagnosticSignError", { fg = color.red, bg = color_special.main_background })
  hl("DiagnosticSignWarn", { fg = color.orange, bg = color_special.main_background })
  hl("DiagnosticSignInfo", { fg = color.gray5, bg = color_special.main_background })
  hl("DiagnosticSignHint", { fg = color.gray5, bg = color_special.main_background })
  hl("DiagnosticSignOk", { fg = color.green, bg = color_special.main_background })

  hl("DiagnosticVirtualTextError", { fg = color.red, bg = color_special.main_background })
  hl("DiagnosticVirtualTextWarn", { fg = color.gray4, bg = color_special.main_background })
  hl("DiagnosticVirtualTextInfo", { fg = color.gray4, bg = color_special.main_background })
  hl("DiagnosticVirtualTextHint", { fg = color.gray4, bg = color_special.main_background })
  hl("DiagnosticVirtualTextOk", { fg = color.gray4, bg = color_special.main_background })

  hl("DiagnosticUnderlineError", { undercurl = true, sp = color.red })
  hl("DiagnosticUnderlineWarn", { undercurl = true, sp = color.orange })
  hl("DiagnosticUnderlineInfo", { undercurl = true, sp = color.gray6 })
  hl("DiagnosticUnderlineHint", { undercurl = true, sp = color.gray6 })
  hl("DiagnosticUnderlineOk", { undercurl = true, sp = color.green })

  -- =========================
  -- Diff / filesystem
  -- =========================

  hl("DiffAdd", { fg = color.green, bg = color.gray1 })
  hl("DiffChange", { fg = color.gray5, bg = color.gray1 })
  hl("DiffDelete", { fg = color.orange, bg = color.gray1 })
  hl("DiffText", { fg = color.gray9, bg = color.gray3 })
  hl("Added", { fg = color.green })
  hl("Changed", { fg = color.gray5 })
  hl("Removed", { fg = color.orange })

  hl("netrwDir", { fg = color.gray5 })
  hl("netrwClassify", { fg = color.gray4 })
  hl("netrwExe", { fg = color.green })
  hl("netrwSymLink", { fg = color.lack })
  hl("netrwLink", { fg = color.lack })
  hl("netrwPlain", { fg = color.luster })
  hl("netrwTreeBar", { fg = color.gray4 })

  -- =========================
  -- Statusbar
  -- =========================

  hl("StatusNorm", { fg = color.gray9, bg = color_special.statusline })
  hl("StatusBuffer", { fg = color.gray4, bg = color_special.statusline })

  hl("StatusLineNum", { fg = color.gray1, bg = color.gray8, bold = true })

  hl("StatusType", { fg = color.gray7, bg = color_special.statusline, bold = true })
  hl("StatusPercent", { fg = color.gray7, bg = color_special.statusline, bold = true })

  hl("StatusModeNorm", { fg = color.gray7, bg = color_special.statusline, bold = true })
  hl("StatusModeInsert", { fg = color_special.statusline, bg = color.lack, bold = true })
  hl("StatusModeCommand", { fg = color_special.statusline, bg = color.lack, bold = true })
  hl("StatusModeVisual", { fg = color_special.statusline, bg = color.gray9, bold = true })
  hl("StatusModeReplace", { fg = color_special.statusline, bg = color.gray9, bold = true })
  hl("StatusModeTerm", { fg = color.black, bg = color.gray7, bold = true })

  hl("StatusLine", { fg = color.gray7, bg = color_special.statusline })
  hl("StatusLineNC", { fg = color.gray4, bg = color.gray1 })

  hl("TabLine", { fg = color.gray4, bg = color.gray2 })
  hl("TabLineFill", { fg = color.gray4, bg = color.gray2 })
  hl("TabLineSel", { fg = color.gray1, bg = color.gray8, bold = true })

  hl("WinBar", { fg = color.gray5, bg = color.gray2 })
  hl("WinBarNC", { fg = color.gray4, bg = color.gray2 })

  link("Folded", "Comment")
  link("FoldColumn", "LineNr")
end

return M
