return {
  cmd = { "tflint", "--langserver" },
  filetypes = {
    "terraform",
    "tf"
  },
  root_markers = {
    ".terraform",
    ".git",
    ".tflint.hcl"
  }
}
