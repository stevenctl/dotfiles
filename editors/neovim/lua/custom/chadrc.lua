-- For MAPPINGS and whichkey I modified `core`. Need to fix that and get back on main chad.

return {
  plugins = {
    ["williamboman/mason.nvim"] = {
      override_options = {
        ensure_installed = {
          "lua-language-server",
          "stylua",

          "gopls",
          "goimports",
          "gofumpt",
          "golangci-lint",

          "rust-analyzer",
          "rustfmt",
        },
      },
    },
    ["williamboman/mason-lspconfig.nvim"] = {
      after = "mason.nvim",
    },
    ["neovim/nvim-lspconfig"] = {
      after = "mason-lspconfig.nvim",
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.lspconfig"
      end,
    },
    ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
    },
    ["jayp0521/mason-null-ls.nvim"] = {
      after = "null-ls.nvim",
      config = function()
        require "custom.null-ls"
      end,
    },
    ["nvim-treesitter/nvim-treesitter"] = {
      override_options = {
        ensure_installed = {
          "markdown",
          "json",
          "yaml",
          "toml",
          "gitignore",
          "dockerfile",

          "javascript",
          "typescript",
          "tsx",
          "html",
          "css",
          "graphql",

          "bash",
          "python",
          "lua",

          "go",
          "rust",
          "c",
          "c_sharp",
          "cmake",
          "cpp",

          "proto",
          "sql",

          "hlsl",
          "wgsl",
          "glsl",
        },
      },
    },
  },
}
