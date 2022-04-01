return require("bufferline").setup {
    options = {
        diagnostics = "nvim_lsp",
        offsets = {{
            filetype = "NvimTree",
            text = "EXPLORER",
            highlight = "Directory",
            text_align = "center"
        }}
    }
}
