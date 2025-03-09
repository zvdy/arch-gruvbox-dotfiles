local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    { import = "plugins" },
    -- add the gruvbox theme
    {
      "morhetz/gruvbox",
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd([[colorscheme gruvbox]])
      end,
    },

  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "gruvbox", "habamax" } },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Control + D show and hide neotree vim keymap
vim.keymap.set('n', '<C-d>', ':Neotree toggle<CR>', { silent = true, desc = 'Toggle Neotree' })