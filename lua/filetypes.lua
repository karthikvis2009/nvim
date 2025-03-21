-- All tcss scss files to be considered as css
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*css",
  command = "set filetype=css"
})

vim.filetype.add({
  filename = {
    ["momentumTransport"] = "foam",
    ["transportProperties"] = "foam",
    ["constantProperties"] = "foam",
    ["turbulenceProperties"] = "foam",
    ["functions"] = "foam",
  }
})
