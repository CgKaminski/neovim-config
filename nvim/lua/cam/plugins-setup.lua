-- bootstrapping neovim plugins using packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim whenever this file is saved
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then 
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim") -- packer install
  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use
  use("morhetz/gruvbox") -- colorscheme
  use("christoomey/vim-tmux-navigator") -- tmux navigator
  use("szw/vim-maximizer") -- maximizes and restores current window
  use("nvim-tree/nvim-tree.lua") -- file expolorer
  use("kyazdani42/nvim-web-devicons") -- icons
  use("nvim-lualine/lualine.nvim") -- status line
  -- fuzzy finding w/ telescope
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
  use("github/copilot.vim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
