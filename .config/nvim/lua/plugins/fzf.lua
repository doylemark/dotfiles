return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  config = function()
    local fzf = require('fzf-lua')
    fzf.setup({
      'ivy',
      winopts = {
        on_create = function()
          vim.api.nvim_buf_set_keymap(0, 't', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
        end,
      },
      actions = {
        files = {
          ['default'] = fzf.actions.file_edit,
          ['ctrl-s']  = fzf.actions.file_split,
          ['ctrl-v']  = fzf.actions.file_vsplit,
          ['ctrl-t']  = fzf.actions.file_tabedit,
        }
      }
    })
    
    -- Set up keybinding
    vim.keymap.set('n', '<leader>sf', fzf.files, { desc = '[S]earch [F]iles' })
  end,
}
