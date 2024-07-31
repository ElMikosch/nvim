return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = 'notes',
        path = '~/vaults/notes',
      },
    },
    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },
    note_id_func = function(title)
      local suffix = ''
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = tostring(os.time()) .. '-' .. string.char(math.random(65, 90))
        end
      end
      return suffix
    end,
    disable_frontmatter = true,
    vim.keymap.set('n', '<leader>ob', ':ObsidianBacklinks<CR>', { desc = '[O]bsidian [B]acklinks' }),
    vim.keymap.set('n', '<leader>on', ':ObsidianNew<CR>', { desc = '[O]bsidian [N]ew' }),
    vim.keymap.set('n', '<leader>cc', ':set conceallevel=2<CR>', { desc = '[C]hange [C]oncellevel' }),
    vim.keymap.set('n', '<leader>cr', ':set conceallevel=0<CR>', { desc = '[C]oncellevel [R]eset' }),
    -- see below for full list of options 👇
  },
}
