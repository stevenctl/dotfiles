---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.builtin.treesitter.ensure_installed, {
  {
    "python",
  }
})

-- Set a formatter.
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
}

-- Set a linter.
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
}

-- TODO: debugpy installed by default
-- Setup dap for python
lvim.builtin.dap.active = true
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function() require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python") end)

-- Supported test frameworks are unittest, pytest and django. By default it
-- tries to detect the runner by probing for pytest.ini and manage.py, if
-- neither are present it defaults to unittest.
pcall(function() require("dap-python").test_runner = "pytest" end)

-- Magma Setup
vim.g.magma_image_provider = "kitty"
-- If this is set to true, then whenever you have an active cell its output
-- window will be automatically shown.
vim.g.magma_automatically_open_output = true
-- If this is true, then text output in the output window will be wrapped.
vim.g.magma_wrap_output = false
-- If this is true, then the output window will have rounded borders.
vim.g.magma_output_window_borders = false
-- The highlight group to be used for highlighting cells.
vim.g.magma_cell_highlight_group = "CursorLine"
-- Where to save/load with :MagmaSave and :MagmaLoad.
vim.g.magma_save_path = vim.fn.stdpath "data" .. "/magma"


------------------------
-- LSP
------------------------
---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pylsp" })
---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.lsp.installer.setup.ensure_installed, { "pylsp" })

local lsp_manager = require "lvim.lsp.manager"

lsp_manager.setup("pylsp", {
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
    local _, _ = pcall(vim.lsp.codelens.refresh)
    local map = function(mode, lhs, rhs, desc)
      if desc then
        desc = desc
      end
      vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc, buffer = bufnr, noremap = true })
    end

    -- dap
    map("n", "<leader>ds", "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection")
    -- code
    map("n", "<leader>cE", "<cmd>lua require('swenv.api').pick_venv()<cr>", "Pick Env")
    map("n", "<leader>ce", "<cmd>lua require('swenv.api').get_current_venv()<cr>", "Current Env")
    -- Jupyter
    map("n", "<leader>ji", "<Cmd>MagmaInit<CR>", "Init Magma")
    map("n", "<leader>jd", "<Cmd>MagmaDeinit<CR>", "Deinit Magma")
    map("n", "<leader>je", "<Cmd>MagmaEvaluateLine<CR>", "Evaluate Line")
    map("n", "<leader>jr", "<Cmd>MagmaReevaluateCell<CR>", "Re evaluate cell")
    map("n", "<leader>jD", "<Cmd>MagmaDelete<CR>", "Delete cell")
    map("n", "<leader>js", "<Cmd>MagmaShowOutput<CR>", "Show Output")
    map("n", "<leader>jR", "<Cmd>MagmaRestart!<CR>", "Restart Magma")
    map("n", "<leader>jS", "<Cmd>MagmaSave<CR>", "Save")
    map("v", "<leader>je", "<esc><cmd>MagmaEvaluateVisual<cr>", "Evaluate Highlighted Line")
  end,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})

-- Additional Plugins
---@diagnostic disable-next-line: missing-parameter
vim.list_extend(lvim.plugins,
  {
    -- You can switch between vritual environmnts.
    "AckslD/swenv.nvim",
    "mfussenegger/nvim-dap-python",
    {
      -- You can generate docstrings automatically.
      "danymat/neogen",
      config = function()
        require("neogen").setup {
          enabled = true,
          languages = {
            python = {
              template = {
                annotation_convention = "numpydoc",
              },
            },
          },
        }
      end,
    },
    -- You can run blocks of code like jupyter notebook.
    { "dccsillag/magma-nvim", run = ":UpdateRemotePlugins" },
  }
)
