-- Bootstrap lazy.nvim if it is not installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Theme and view
    { 'rafi/awesome-vim-colorschemes' }, -- Retro Scheme

    -- Plugins
    { 'tpope/vim-commentary' }, -- For Commenting gcc & gc
    { 'vim-airline/vim-airline' },
    { 'github/copilot.vim' },
})