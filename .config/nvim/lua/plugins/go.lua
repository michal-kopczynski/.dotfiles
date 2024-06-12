-- go.nvim plugin
-- example config: https://github.com/ray-x/go.nvim/blob/master/playground/init_lazy.lua
return {
  'ray-x/go.nvim',
  dependencies = { -- optional packages
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
    'mfussenegger/nvim-dap', -- Debug Adapter Protocol
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text',
  },
  config = function()
    require('go').setup()
  end,
  event = { 'CmdlineEnter' },
  ft = { 'go', 'gomod', 'gosum', 'gotmpl', 'gohtmltmpl', 'gotexttmpl' },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
