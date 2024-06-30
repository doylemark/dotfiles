return {
  'nvim-tree/nvim-tree.lua',
  keys = {
    { '<leader>e', ':NvimTreeToggle<CR>' },
  },
  opts = {
    sort = {
      sorter = 'case_sensitive',
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      enable = false,
    },
  },
  config = function()
    local function grep_at_current_tree_node()
      local node = require('nvim-tree.lib').get_node_at_cursor()
      if node then
        require('telescope.builtin').live_grep {
          search_dirs = { node.absolute_path },
          prompt_title = string.format('Grep in [%s]', vim.fs.basename(node.absolute_path) or 'current node'),
        }
      end
    end

    vim.keymap.set('n', '<leader>st', grep_at_current_tree_node, { desc = '[S]earch [T]ree' })

    require('nvim-tree').setup {
      -- All other configurations go inside the setup function
      sort_by = 'case_sensitive', -- Assuming 'sort' refers to file sorting within the tree
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        enable = false,
      },
    }
    -- Setting up the keymap inside the config block to overrule any other default key settings.
  end,
}
