return { 
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",                      
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { 'numToStr/Comment.nvim', opts = {} },
    require('imrashb.plugins.tree'),
    require('imrashb.plugins.telescope'),
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'}
}

