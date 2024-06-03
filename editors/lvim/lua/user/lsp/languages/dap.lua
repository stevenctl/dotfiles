 local status_ok, dap = pcall(require, "dap")
  if not status_ok then
    return
  end
  -- go
  -- dap.adapters.delve = {
  --   type = "server",
  --   host = "127.0.0.1",
  --   port = 40000,
  -- }
  -- dap.configurations.go = {
  --   {
  --     type = "delve",
  --     name = "Debug (Attach 40000)",
  --     request = "attach",
  --     mode = "remote",
  --   },
  -- }

  -- rust
  dap.adapters.codelldb = codelldb_adapter
  dap.configurations.rust = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        ---@diagnostic disable-next-line
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  }

print("DAP up")
