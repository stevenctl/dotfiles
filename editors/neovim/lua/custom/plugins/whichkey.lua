local present, wk = pcall(require, "which-key")

if not present then
  return
end

wk.register({
  f = {name="find"},
  d = {name="debug"},
  v = {name="vcs"},
  g = {name="goto"},
  u = {name="update"},
  s = {name="split"},
  t = {name="test"},
}, {prefix="<leader>"})
