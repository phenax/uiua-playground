-- My repl config: https://github.com/phenax/neovim-config/blob/main/lua/phenax/repl.lua
--- @type table
Repl = Repl

Repl.replModes.uiua = {
  config = {
    command = 'uiua repl',
    clear_screen = false,
    width = function(w) return w * 0.4 end,
  }
}

Repl.apply_repl_mode('uiua')
