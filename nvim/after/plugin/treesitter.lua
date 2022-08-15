require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",

    sync_install = false,

    ignore_install = { "phpdoc", "tree-sitter-phpdoc" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = {"phpdoc", "tree-sitter-phpdoc"}
    },
    autopairs = {
        enable = true,
    },
}
