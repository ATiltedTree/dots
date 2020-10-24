local Color, colors, Group, groups, styles = require('colorbuddy').setup()

Color.new("nord0", "#2E3440")
Color.new("nord1", "#3B4252")
Color.new("nord2", "#434C5E")
Color.new("nord3", "#4C566A")
Color.new("nord4", "#D8DEE9")
Color.new("nord5", "#E5E9F0")
Color.new("nord6", "#ECEFF4")
Color.new("nord7", "#8FBCBB")
Color.new("nord8", "#88C0D0")
Color.new("nord9", "#81A1C1")
Color.new("nord10", "#5E81AC")
Color.new("nord11", "#BF616A")
Color.new("nord12", "#D08770")
Color.new("nord13", "#EBCB8B")
Color.new("nord14", "#A3BE8C")
Color.new("nord15", "#B48EAD")

Color.new("nord3_bright", "#616E88")

-- UI Components

---- Editor
Group.new("ColorColumn", colors.none, colors.nord1)
Group.new("Cursor", colors.nord0, colors.nord4)
Group.new("CursorLine", colors.none, colors.nord1)
Group.new("Error", colors.nord4, colors.nord11)
Group.new("iCursor", colors.nord0, colors.nord4)
Group.new("LineNr", colors.nord3,colors.none)
Group.new("MatchParen", colors.nord8, colors.nord3)
Group.new("NonText", colors.nord2,colors.none)
Group.new("Normal", colors.nord4, colors.nord0)
Group.new("NormalFloat", colors.nord4, colors.nord2)
Group.new("PMenu", colors.nord4, colors.nord2)
Group.new("PmenuSbar", colors.nord4, colors.nord2)
Group.new("PMenuSel", colors.nord8, colors.nord3)
Group.new("PmenuThumb", colors.nord8, colors.nord3)
Group.new("SpecialKey", colors.nord3,colors.none)
Group.new("SpellBad", colors.nord11, colors.nord0, styles.undercurl)
Group.new("SpellCap", colors.nord13, colors.nord0, styles.undercurl)
Group.new("SpellLocal", colors.nord5, colors.nord0, styles.undercurl)
Group.new("SpellRare", colors.nord6, colors.nord0, styles.undercurl)
Group.new("Visual", colors.none, colors.nord2)
Group.new("VisualNOS", colors.none, colors.nord2)

---- Neovim Support
Group.new("healthError", colors.nord11, colors.nord1)
Group.new("healthSuccess", colors.nord14, colors.nord1)
Group.new("healthWarning", colors.nord13, colors.nord1)
Group.new("TermCursorNC", colors.none, colors.nord1)

---- Gutter
Group.new("CursorColumn", colors.none, colors.nord1)
Group.new("CursorLineNr", colors.nord4,colors.none)
Group.new("Folded", colors.nord3, colors.nord1, styles.bold)
Group.new("FoldColumn", colors.nord3, colors.nord0)
Group.new("SignColumn", colors.nord1, colors.nord0)

---- Navigation
Group.new("Directory", colors.nord8,colors.none)

---- Prompt/Status
Group.new("EndOfBuffer", colors.nord1,colors.none)
Group.new("ErrorMsg", colors.nord4, colors.nord11)
Group.new("ModeMsg", colors.nord4,colors.none)
Group.new("MoreMsg", colors.nord8,colors.none)
Group.new("Question", colors.nord4,colors.none)
Group.new("StatusLine", colors.nord8, colors.nord3)
Group.new("StatusLineNC", colors.nord4, colors.nord1)
Group.new("StatusLineTerm", colors.nord8, colors.nord3)
Group.new("StatusLineTermNC", colors.nord4, colors.nord1)
Group.new("WarningMsg", colors.nord0, colors.nord13)
Group.new("WildMenu", colors.nord8, colors.nord1)

---- Search
Group.new("IncSearch", colors.nord6, colors.nord10, styles.underline)
Group.new("Search", colors.nord1, colors.nord8)

---- Tabs
Group.new("TabLine", colors.nord4, colors.nord1)
Group.new("TabLineFill", colors.nord4, colors.nord1)
Group.new("TabLineSel", colors.nord8, colors.nord3)

---- Window
Group.new("Title", colors.nord4,colors.none)
Group.new("VertSplit", colors.nord2, colors.nord0)

-- Language Base Groups
Group.new("Normal",colors.none,colors.none)
Group.new("Boolean", colors.nord9, colors.none)
Group.new("Character", colors.nord14, colors.none)
Group.new("Comment", colors.nord3_bright, colors.none)
Group.new("Conditional", colors.nord9, colors.none)
Group.new("Constant", colors.nord4, colors.none)
Group.new("Define", colors.nord9, colors.none)
Group.new("Delimiter", colors.nord6, colors.none)
Group.new("Exception", colors.nord9, colors.none)
Group.new("Float", colors.nord15, colors.none)
Group.new("Function", colors.nord8, colors.none)
Group.new("Identifier", colors.nord4, colors.none)
Group.new("Include", colors.nord9, colors.none)
Group.new("Keyword", colors.nord9, colors.none)
Group.new("Label", colors.nord9, colors.none)
Group.new("Number", colors.nord15, colors.none)
Group.new("Operator", colors.nord9, colors.none)
Group.new("PreProc", colors.nord9, colors.none)
Group.new("Repeat", colors.nord9, colors.none)
Group.new("Special", colors.nord4, colors.none)
Group.new("SpecialChar", colors.nord13, colors.none)
Group.new("SpecialComment", colors.nord8, colors.none)
Group.new("Statement", colors.nord9, colors.none)
Group.new("StorageClass", colors.nord9, colors.none)
Group.new("String", colors.nord14, colors.none)
Group.new("Structure", colors.nord9, colors.none)
Group.new("Tag", colors.nord4, colors.none)
Group.new("Todo", colors.nord13, colors.none)
Group.new("Type", colors.nord9, colors.none)
Group.new("Typedef", colors.nord9, colors.none)
Group.new("Macro", colors.nord8,colors.none,styles.bold)

---- Rust
Group.new("rustModPath", colors.nord7, colors.none,  styles.none)

-- Plugin Support

---- Nvim LSP
Group.new("Error",colors.nord11,colors.none)
Group.new("Warning", colors.nord13,colors.none)
Group.new("Information" , colors.nord8,colors.none)
Group.new("Hint" , colors.nord10,colors.none)

Group.new("LspDiagnosticsError" , groups.Error,groups.Error)
Group.new("LspDiagnosticsWarning", groups.Warning,groups.Warning)
Group.new("LspDiagnosticsInformation" , groups.Information,groups.Information)
Group.new("LspDiagnosticsHint" , groups.Hint,groups.Hint)

Group.new("LspDiagnosticsUnderlineError",groups.Error,groups.Error,styles.undercurl)
Group.new("LspDiagnosticsUnderlineWarning",groups.Warning,groups.Warning,styles.undercurl)
Group.new("LspDiagnosticsUnderlineInformation",groups.Information,groups.Information,styles.undercurl)
Group.new("LspDiagnosticsUnderlineHint",groups.Hint,groups.Hint,styles.undercurl)

---- GitGutter
Group.new("GitGutterAdd", colors.nord14,colors.none)
Group.new("GitGutterChange", colors.nord13,colors.none)
Group.new("GitGutterChangeDelete", colors.nord11,colors.none)
Group.new("GitGutterDelete", colors.nord11,colors.none)


---- vim-startify
Group.new("StartifyFile", colors.nord6,colors.none)
Group.new("StartifyFooter", colors.nord7,colors.none)
Group.new("StartifyHeader", colors.nord8,colors.none)
Group.new("StartifyNumber", colors.nord7,colors.none)
Group.new("StartifyPath", colors.nord8,colors.none)
Group.new("StartifyBracket",groups.Delimiter,groups.Delimiter)
Group.new("StartifySlash",groups.Normal,groups.Normal)
Group.new("StartifySpecial",groups.Comment,groups.Comment)

