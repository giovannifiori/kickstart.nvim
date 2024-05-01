return {
  'rose-pine/neovim',
  name = 'rose-pine',
  config = function()
    require('rose-pine').setup {
      variant = 'auto',
      dark_variant = 'main',
    }

    local system_bg = 'light'
    local apple_interface_style = vim.fn.system 'defaults read -g AppleInterfaceStyle'
    if string.find(apple_interface_style, 'Dark') then
      system_bg = 'dark'
    end
    vim.o.bg = system_bg

    vim.cmd.colorscheme 'rose-pine'
  end,
}
