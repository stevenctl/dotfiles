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
      }
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
      }
    }
  }
}
