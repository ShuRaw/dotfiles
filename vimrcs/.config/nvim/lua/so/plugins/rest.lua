local opts = {}
opts.result_split_horizontal = false
-- Skip SSL verification, useful for unknown certificates
opts.skip_ssl_verification = false
-- Highlight request on run
opts.highlight = {
  enabled = true,
  timeout = 150
}
opts.result = {
  -- toggle showing URL, HTTP info, headers at top the of result window
  show_url = true,
  show_http_info = true,
  show_headers = true
}
-- Jump to request line on run
opts.jump_to_request = false
opts.env_file = ".env"
opts.custom_dynamic_variables = {}
opts.yank_dry_run = true
return opts
