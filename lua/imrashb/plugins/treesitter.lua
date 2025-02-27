return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "javascript",
                "html",
                "typescript",
                "cpp",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true,
        })
        require("nvim-treesitter.install").compilers = { "clang", "gcc" }
    end,
}
