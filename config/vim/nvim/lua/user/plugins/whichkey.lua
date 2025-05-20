return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    wk.setup({
      triggers_blacklist = {
        -- list of mode / prefixes that should never be hooked by WhichKey
        i = { "j", "k" },
        v = { "j", "k" },
      },
    })
    wk.register(require("user.keymaps").which_keys, {prefix = "<leader>" })
  end
}
