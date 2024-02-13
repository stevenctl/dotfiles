-- require('lspconfig').gdscript.setup { -- If things get laggy, uncomment:
--   -- flags = {
--   --   debounce_text_changes = 150,
--   -- },
--   on_attach = function(client, bufnr)


--     local map = function(mode, lhs, rhs, desc)
--       if desc then
--         desc = desc
--       end

--       vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
--     end

--   end
-- }
local cmd = {'ncat', '127.0.0.1', '6005'}
local lsp_manager = require "lvim.lsp.manager"
local util = require 'lspconfig.util'

if vim.fn.has('macunix') then
  cmd = nil
end

lsp_manager.setup("gdscript", {
  cmd = cmd,
  on_attach = function(client, bufnr)
    -- TODO this breaks anything but the first buffer getting attached
    -- pipe lets Godot editor trigger files in nvim
    -- vim.api.nvim_command('echo serverstart("/tmp/godot.pipe")')
    
    -- tabs/spaces must not be mixed
    vim.o.expandtab = false

    require("lvim.lsp").common_on_attach(client, bufnr)
    local map = function(mode, lhs, rhs, desc)
      if desc then
        desc = desc
      end
      vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
    end

    -- map("n", "K", vim.lsp.buf.hover, "Hover Actions")
    -- map("n", "gd", vim.lsp.buf.definition, "Definition")
    -- map("n", "gD", vim.lsp.buf.declaration, "Declaration")
  end,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
  -- root_dir = util.root_pattern('project.godot', '.git'),
  root_dir = function ()
   return "C:/Users/Steven/gamedev/short-dungeon/godot"
  end
})

-- TODO debugger
-- local debug_port = os.getenv('GDSCRIPT_DAP_PORT') or '6007'
