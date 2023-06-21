vim.list_extend(lvim.plugins, {
  { 
    "rcarriga/nvim-notify",
    lazy = false,
    config = function() 
      local notify = require("notify");
      notify.setup({
        background_colour = "#000000",
      });
      vim.notify = notify
    end
  }
})
