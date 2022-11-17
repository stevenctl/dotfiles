return {
  ["folke/which-key.nvim"] = {
    module = "which-key",
    keys = { "<leader>", '"', "'", "`", "g" },
    config = function()
      require "plugins.configs.whichkey"
      require "custom.plugins.whichkey"
    end,
    setup = function()
      require("core.utils").load_mappings "whichkey"
    end,
  },
  ["nvim-telescope/telescope.nvim"] = {
    requires = {
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    config = function()
      require "plugins.configs.telescope"
      ---@diagnostic disable-next-line: different-requires
      require("telescope").load_extension "live_grep_args"
    end,
  },
  ["williamboman/mason.nvim"] = {
    override_options = require "custom.plugins.mason",
  },
  ["williamboman/mason-lspconfig.nvim"] = {
    after = "mason.nvim",
  },
  ["neovim/nvim-lspconfig"] = {
    after = "mason-lspconfig.nvim",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
  },
  ["jayp0521/mason-null-ls.nvim"] = {
    after = "null-ls.nvim",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = require "custom.plugins.treesitter",
  },
}
