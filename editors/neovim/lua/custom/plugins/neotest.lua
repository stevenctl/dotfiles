local ok, neotest = pcall(require, "neotest")
if not ok then
  return
end

neotest.setup({
  adapters = {
    -- require("neotest-vim-test"),
    require("neotest-rust"),
    require("neotest-go"),
  },
})

