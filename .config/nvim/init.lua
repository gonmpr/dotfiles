vim.cmd.colorscheme("habamax")
require("config.colors.habamax").setup()


-- Basics
require("config.core.settings")
require("config.core.keymaps")
require("config.core.autocmds")

-- Features
require("config.features.autocomplete")
require("config.features.finder")

require("config.features.statusbar")
require("config.features.symcolumn")

