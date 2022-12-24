---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.plugins, {
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup({
        highlight = {
          pattern = [[.*<(KEYWORDS)\s*]], -- pattern or table of patterns, used for highlightng (vim regex)
          comments_only = true, -- uses treesitter to match keywords in comments only
          exclude = {}, -- list of file types to exclude highlighting
        },
        search = {
          pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
        },
        merge_keywords = false, -- when true, custom keywords will be merged with the defaults
        keywords = {
          FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
          },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        },
      })
    end,
  },
})
