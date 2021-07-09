local M = {}

M.config = function()
  vim.g.dashboard_disable_at_vimenter = 0

  vim.g.dashboard_custom_header = O.dashboard.custom_header

  vim.g.dashboard_default_executive = "telescope"

  vim.g.dashboard_custom_section = {
    a = {
      description = { "  Vimwiki            " },
      -- command = "<Plug>VimwikiIndex",
      command = ":e ~/vimwiki/index.wiki",
    },
    g = {
      description = { "  Find File          " },
      command = "Telescope find_files",
    },
    h = {
      description = { "  Recently Used Files" },
      command = "Telescope oldfiles",
    },
    j = {
      description = { "  Load Last Session  " },
      command = "SessionLoad",
    },
    l = {
      description = { "  Find Word          " },
      command = "Telescope live_grep",
    },
    n = {
      description = { "  Settings           " },
      command = ":e " .. CONFIG_PATH .. "/lv-config.lua",
    },
    -- f = {
    --   description = { "  Neovim Config Files" },
    --   command = "Telescope find_files cwd=" .. CONFIG_PATH,
    -- },
    -- e = {description = {'  Marks              '}, command = 'Telescope marks'}
  }
  vim.cmd "let g:dashboard_session_directory = $HOME..'/.config/nvim/.sessions'"
  vim.cmd "let packages = len(globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))"

  vim.api.nvim_exec(
    [[
    let g:dashboard_custom_footer = ['LuaJIT loaded '..packages..' plugins']
]],
    false
  )

  -- file_browser = {description = {' File Browser'}, command = 'Telescope find_files'},

  -- vim.g.dashboard_session_directory = CACHE_PATH..'/session'
  -- vim.g.dashboard_custom_footer = O.dashboard.footer
end

require("lv-utils").define_augroups {
  _dashboard = {
    -- seems to be nobuflisted that makes my stuff disapear will do more testing
    {
      "FileType",
      "dashboard",
      "setlocal nocursorline noswapfile synmaxcol& signcolumn=no norelativenumber nocursorcolumn nospell  nolist  nonumber bufhidden=wipe colorcolumn= foldcolumn=0 matchpairs= ",
    },
    {
      "FileType",
      "dashboard",
      "set showtabline=0 | autocmd BufLeave <buffer> set showtabline=2",
    },
    { "FileType", "dashboard", "nnoremap <silent> <buffer> q :q<CR>" },
  },
}

return M
