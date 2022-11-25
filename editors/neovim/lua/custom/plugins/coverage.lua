local ok, coverage = pcall(require, "coverage")
if not ok then
  return
end

coverage.setup {
  commands = true, -- create commands
  highlights = {
    -- customize highlight groups created by the plugin
    covered = { fg = "#6F8" }, -- supports style, fg, bg, sp (see :h highlight-gui)
    uncovered = { fg = "#fC0" },
  },
  signs = {
    -- use your own highlight groups or text markers
    covered = { hl = "CoverageCovered", text = "" },
    uncovered = { hl = "CoverageUncovered", text = "" },
  },
  summary = {
    -- customize the summary pop-up
    min_coverage = 80.0, -- minimum coverage threshold (used for highlighting)
  },
  lang = {
    -- customize language specific settings
  },
}
