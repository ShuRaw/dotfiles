local telescope_ok, telescope = pcall(require, "telescope")
if telescope_ok then
  telescope.load_extension("fzf")
end