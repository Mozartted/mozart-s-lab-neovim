-- LSP Configurations
vim.lsp.set_log_level("debug")
return {
  -- tools
  -- {
  --   "williamboman/mason.nvim",
  --   opts = function(_, opts)
  --     vim.list_extend(opts.ensure_installed, {
  --       "stylua",
  --       "selene",
  --       "luacheck",
  --       "shellcheck",
  --       "shfmt",
  --       "tailwindcss-language-server",
  --       "css-lsp",
  --     })
  --   end,
  -- },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "solidity_ls_nomicfoundation",
  --     },
  --   },
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        solidity_ls_nomicfoundation = {
          default_config = {
            cmd = { vim.fn.stdpath("data") .. "/mason/bin/nomicfoundation-solidity-language-server", "--studio" },
            filetypes = { "solidity" },
            -- capabilities = require("blink.cmp").get_lsp_capabilities(),
            -- root_dir = require("lspconfig").util.find_git_ancestor,
          },
        },
      },
    },
  },
}
