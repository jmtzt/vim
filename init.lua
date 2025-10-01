-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Copilot configs
vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = { markdown = true, yaml = true }

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

----
-- NOTE: [[ Opts ]]
----

-- UI and Visuals
-- -- Use a block cursor in all modes (disable fancy GUI cursor styles)
vim.opt.guicursor = ''

-- Show absolute and relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Highlight the current line
vim.opt.cursorline = true

-- Enable true color support
vim.opt.termguicolors = true

-- Always show the sign column (e.g., for Git or LSP)
vim.opt.signcolumn = 'yes'

-- Show a vertical line at column 80
vim.opt.colorcolumn = '80'

-- Display whitespace characters
vim.opt.list = true
vim.opt.listchars = { tab = '| ', trail = '·', nbsp = '␣' }

-- Don't show the mode (e.g., -- INSERT --) in the command line
vim.opt.showmode = false

-- Treat '@' as part of a filename
vim.opt.isfname:append '@-@'

-- Mouse & Clipboard

-- Enable mouse support
vim.opt.mouse = 'a'

-- Sync clipboard between OS and Neovim (after UI loads for better startup performance)
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Ask to save on quit or other destructive commands
vim.opt.confirm = true

-- Editing behaviour

-- Highlight search disabled, but incremental search enabled
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Preview live substitutions
vim.opt.inccommand = 'split'

-- Case-insensitive search unless capital letters are used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable smart indentation
vim.opt.smartindent = true
vim.opt.breakindent = true

-- Tabs and Indentation

-- Use 4 spaces for tabs and indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Disable line wrapping
vim.opt.wrap = false

-- Files, Undo & Backup

-- Disable swap and backup files
vim.opt.swapfile = false
vim.opt.backup = false

-- Save undo history to file
vim.opt.undofile = true

-- Splits & Layout

-- Open vertical splits to the right
vim.opt.splitright = true

-- Open horizontal splits below
vim.opt.splitbelow = true

-- Performance & Responsiveness

-- Reduce update time for better responsiveness (like CursorHold events)
vim.opt.updatetime = 150

-- Minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Reduce delay for mapped key sequences
vim.opt.timeoutlen = 300

----
-- NOTE: [[ Keymaps ]]
----

--
-- NORMAL Mode remaps
--
-- quickfix navigation
vim.keymap.set('n', '<leader>j', '<cmd>cnext<CR>', { desc = 'Next quickfix item' })
vim.keymap.set('n', '<leader>k', '<cmd>cprev<CR>', { desc = 'Previous quickfix item' })
--
-- Disable the default behavior of `s` in normal mode due to mini.surround.nvim
vim.keymap.set({ 'n', 'x' }, 's', '<Nop>')

-- Save the current file with Ctrl+S
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = 'Save file' })

-- Go to the previous buffer
vim.keymap.set('n', '[b', ':bp<CR>', { desc = 'Previous buffer' })

-- Go to the next buffer
vim.keymap.set('n', ']b', ':bn<CR>', { desc = 'Next buffer' })

-- Open file explorer (Ex mode / netrw)
vim.keymap.set('n', '<leader>st', vim.cmd.Ex, { desc = 'Open file explorer' })

-- Join lines but keep the cursor in place
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines without moving cursor' })

-- Keep search term centered after next match
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Next search result centered' })

-- Keep search term centered after previous match
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Previous search result centered' })

-- Disable Q (default Ex mode)
vim.keymap.set('n', 'Q', '<nop>', { desc = 'Disable Q' })

-- Half-page down and center the cursor
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half-page down + center' })

-- Half-page up and center the cursor
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half-page up + center' })

-- Quickfix list: next item
vim.keymap.set('n', '<M-[>', '<cmd>cnext<CR>', { desc = 'Next quickfix item' })

-- Quickfix list: previous item
vim.keymap.set('n', '<M-]>', '<cmd>cprev<CR>', { desc = 'Previous quickfix item' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- LeetCode.nvim
vim.keymap.set('n', '<leader>lr', '<cmd>Leet run<cr>', { desc = 'Run Leetcode' })
vim.keymap.set('n', '<leader>ls', '<cmd>Leet submit<cr>', { desc = 'Submit Leetcode' })
vim.keymap.set('n', '<leader>ld', '<cmd>Leet desc<cr>', { desc = 'Description Leetcode' })
vim.keymap.set('n', '<leader>ll', '<cmd>Leet<cr>', { desc = 'Leetcode' })
vim.keymap.set('n', '<leader>lv', '<cmd>LspRestart<cr>', { desc = 'Restart LSP' })

--
-- INSERT Mode remaps
--

--  remap jk to esc
vim.keymap.set('i', 'jk', '<Esc>')

vim.api.nvim_set_keymap('i', '<C-x>', 'copilot#Accept("<CR>")', { silent = true, expr = true })

--
-- VISUAL Mode remaps
--

-- Move selected lines down and reselect them
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })

-- Move selected lines up and reselect them
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

--
-- TERMINAL Mode remaps
--

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

----
-- NOTE: [[ Basic Autocommands ]]
----
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- TODO: Add LeetCode.nvim
--
-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    event = 'VeryLazy',
    config = function()
      local harpoon = require 'harpoon'
      local k = require 'config.user.customkey'
      local opts = require('config.user.customkey').opts

      harpoon:setup {
        settings = {
          save_on_toggle = true, -- Save state on window toggle
        },
      }

      -- Telescope Config
      local conf = require('telescope.config').values
      local pickers = require 'telescope.pickers'
      local themes = require 'telescope.themes'
      local finders = require 'telescope.finders'
      local actions = require 'telescope.actions'
      local action_state = require 'telescope.actions.state'

      local function generate_new_finder(harpoon_files)
        local files = {}
        for i, item in ipairs(harpoon_files.items) do
          table.insert(files, i .. '. ' .. item.value)
        end

        return finders.new_table {
          results = files,
        }
      end

      -- move_mark_up will move the mark up in the list, refresh the picker's result list and move the selection accordingly
      local function move_mark_up(prompt_bufnr, harpoon_files)
        local selection = action_state.get_selected_entry()
        if not selection then
          return
        end
        if selection.index == 1 then
          return
        end

        local mark = harpoon_files.items[selection.index]

        table.remove(harpoon_files.items, selection.index)
        table.insert(harpoon_files.items, selection.index - 1, mark)

        local current_picker = action_state.get_current_picker(prompt_bufnr)
        current_picker:refresh(generate_new_finder(harpoon_files), {})

        -- yes defer_fn is an awful solution. If you find a better one, please let the world know.
        -- it's used here because we need to wait for the picker to refresh before we can set the selection
        -- actions.move_selection_previous() doesn't work here because the selection gets reset to 0 on every refresh.
        vim.defer_fn(function()
          -- don't even bother finding out why this is -2 here. (i don't know either)
          current_picker:set_selection(selection.index - 2)
        end, 2) -- 2ms was the minimum delay I could find that worked without glitching out the picker
      end

      -- move_mark_down will move the mark down in the list, refresh the picker's result list and move the selection accordingly
      local function move_mark_down(prompt_bufnr, harpoon_files)
        local selection = action_state.get_selected_entry()
        if not selection then
          return
        end

        local length = harpoon:list():length()
        if selection.index == length then
          return
        end

        local mark = harpoon_files.items[selection.index]

        table.remove(harpoon_files.items, selection.index)
        table.insert(harpoon_files.items, selection.index + 1, mark)

        local current_picker = action_state.get_current_picker(prompt_bufnr)
        current_picker:refresh(generate_new_finder(harpoon_files), {})

        -- yes defer_fn is an awful solution. If you find a better one, please let the world know.
        -- it's used here because we need to wait for the picker to refresh before we can set the selection
        -- actions.move_selection_next() doesn't work here because the selection gets reset to 0 on every refresh.
        vim.defer_fn(function()
          current_picker:set_selection(selection.index)
        end, 2) -- 2ms was the minimum delay I could find that worked without glitching out the picker
      end

      local function toggle_telescope(harpoon_files)
        pickers
          .new(
            themes.get_dropdown {
              --TODO: make previewer work.
              previewer = false,
            },
            {
              prompt_title = 'Harpoon',
              finder = generate_new_finder(harpoon_files),
              previewer = conf.file_previewer {},
              sorter = conf.generic_sorter {},
              -- Initial mode, change this to your liking. Normal mode is better for navigating with j/k
              initial_mode = 'normal',
              -- Make telescope select buffer from harpoon list
              attach_mappings = function(_, map)
                actions.select_default:replace(function(prompt_bufnr)
                  local curr_entry = action_state.get_selected_entry()
                  if not curr_entry then
                    return
                  end
                  actions.close(prompt_bufnr)

                  harpoon:list():select(curr_entry.index)
                end)
                -- Delete entries in insert mode from harpoon list with <C-d>
                -- Change the keybinding to your liking
                map({ 'n', 'i' }, '<C-d>', function(prompt_bufnr)
                  local curr_picker = action_state.get_current_picker(prompt_bufnr)

                  curr_picker:delete_selection(function(selection)
                    harpoon:list():removeAt(selection.index)
                  end)
                end)
                -- Move entries up and down with <C-j> and <C-k>
                -- Change the keybinding to your liking
                map({ 'n', 'i' }, '<C-j>', function(prompt_bufnr)
                  move_mark_down(prompt_bufnr, harpoon_files)
                end)
                map({ 'n', 'i' }, '<C-k>', function(prompt_bufnr)
                  move_mark_up(prompt_bufnr, harpoon_files)
                end)

                return true
              end,
            }
          )
          :find()
      end

      -- Telescope Harpoon List
      k.nmap {
        '<leader>hh',
        function()
          toggle_telescope(harpoon:list())
        end,
        opts { desc = 'List Harpoon Files (Telescope)' },
      }

      -- Append to Harpoon List
      k.nmap {
        '<leader>ha',
        function()
          harpoon:list():add()
        end,
        opts { desc = 'Append File to Harpoon' },
      }

      -- Display Harpoon List
      k.nmap {
        '<leader>hl',
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        opts { desc = 'List Harpoon Files' },
      }

      -- Go to Previous Harpoon File
      k.nmap {
        '[a',
        function()
          harpoon:list():prev { ui_nav_wrap = true }
        end,
        opts { desc = 'Previous Harpoon File' },
      }

      -- Go to Next Harpoon File
      k.nmap {
        ']a',
        function()
          harpoon:list():next { ui_nav_wrap = true }
        end,
        opts { desc = 'Next Harpoon File' },
      }

      -- Clear harpoon List
      k.nmap {
        '<leader>hc',
        function()
          harpoon:list():clear()
        end,
        opts { desc = 'Clear Harpoon List' },
      }

      -- Select Harpoon File from List (1-5)
      for i = 1, 5 do
        k.nmap {
          string.format('<C-%s>', i),
          function()
            harpoon:list():select(i)
          end,
        }
      end
    end,
  },
  {
    'szymonwilczek/vim-be-better',
    config = function()
      -- Optional: Enable logging for debugging
      vim.g.vim_be_better_log_file = 1
    end,
  },
  {
    'tris203/precognition.nvim',
  },
  -- {
  --   'm4xshen/hardtime.nvim',
  --   lazy = false,
  --   dependencies = { 'MunifTanjim/nui.nvim' },
  --   opts = {},
  -- },
  {
    'kawre/leetcode.nvim',
    build = ':TSUpdate html',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'nvim-lua/plenary.nvim', -- required by telescope
      'MunifTanjim/nui.nvim',

      -- optional
      'nvim-treesitter/nvim-treesitter',
      'rcarriga/nvim-notify',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      -- configuration goes here
      lang = 'python3',
      storage = {
        home = '/Users/c0mrade/personal/projects/leetcode/leetcode.nvim',
        cache = '/Users/c0mrade/personal/projects/leetcode/leetcode.nvim.cache',
      },
      injector = {
        ['python3'] = {
          before = true,
        },
      },
      description = {
        width = '30%',
      },
    },
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-python',
    },
    keys = {
      { '<leader>na', '<cmd>Neotest attach<cr>', desc = 'Neotest attach' },
      { '<leader>nr', '<cmd>Neotest run<cr>', desc = 'Neotest run' },
      { '<leader>no', '<cmd>Neotest output<cr>', desc = 'Neotest output' },
      { '<leader>np', '<cmd>Neotest output-panel<cr>', desc = 'Neotest output panel' },
      { '<leader>ns', '<cmd>Neotest stop<cr>', desc = 'Neotest stop' },
      { '<leader>nm', '<cmd>Neotest summary<cr>', desc = 'Neotest summary' },
    },
  },
  'github/copilot.vim', -- Copilot
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  {
    'Vigemus/iron.nvim',
    keys = {
      { '<leader>pi', vim.cmd.IronRepl, desc = '󱠤 Toggle REPL' },
      { '<leader>pI', vim.cmd.IronRestart, desc = '󱠤 Restart REPL' },

      -- these keymaps need no right-hand-side, since that is defined by the
      -- plugin config further below
      { '+', mode = { 'n', 'x' }, desc = '󱠤 Send-to-REPL Operator' },
      { '++', desc = '󱠤 Send Line to REPL' },
    },

    -- since irons's setup call is `require("iron.core").setup`, instead of
    -- `require("iron").setup` like other plugins would do, we need to tell
    -- lazy.nvim which module to via the `main` key
    main = 'iron.core',

    opts = {
      keymaps = {
        send_line = '++',
        visual_send = '+',
        send_motion = '+',
      },
      config = {
        -- This defines how the repl is opened. Here, we set the REPL window
        -- to open in a horizontal split to the bottom, with a height of 10.
        repl_open_cmd = 'horizontal bot 10 split',

        -- This defines which binary to use for the REPL. If `ipython` is
        -- available, it will use `ipython`, otherwise it will use `python3`.
        -- since the python repl does not play well with indents, it's
        -- preferable to use `ipython` or `bypython` here.
        -- (see: https://github.com/Vigemus/iron.nvim/issues/348)
        repl_definition = {
          python = {
            command = function()
              local ipythonAvailable = vim.fn.executable 'ipython' == 1
              local binary = ipythonAvailable and 'ipython' or 'python3'
              return { binary }
            end,
          },
        },
      },
    },
  },
  -- DAP Client for nvim
  -- * start the debugger with `<leader>dc`
  -- * add breakpoints with `<leader>db`
  -- * terminate the debugger `<leader>dt`
  {
    'mfussenegger/nvim-dap',
    keys = {
      {
        '<leader>dc',
        function()
          require('dap').continue()
        end,
        desc = 'Start/Continue Debugger',
      },
      {
        '<leader>db',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = 'Add Breakpoint',
      },
      {
        '<leader>dt',
        function()
          require('dap').terminate()
        end,
        desc = 'Terminate Debugger',
      },
    },
  },

  -- UI for the debugger
  -- * the debugger UI is also automatically opened when starting/stopping the debugger
  -- * toggle debugger UI manually with `<leader>du`
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    keys = {
      {
        '<leader>du',
        function()
          require('dapui').toggle()
        end,
        desc = 'Toggle Debugger UI',
      },
    },
    -- automatically open/close the DAP UI when starting/stopping the debugger
    config = function()
      local listener = require('dap').listeners
      listener.after.event_initialized['dapui_config'] = function()
        require('dapui').open()
      end
      listener.before.event_terminated['dapui_config'] = function()
        require('dapui').close()
      end
      listener.before.event_exited['dapui_config'] = function()
        require('dapui').close()
      end
    end,
  },

  -- Configuration for the python debugger
  -- * configures debugpy for us
  -- * uses the debugpy installation from mason
  {
    'mfussenegger/nvim-dap-python',
    dependencies = 'mfussenegger/nvim-dap',
    config = function()
      -- fix: E5108: Error executing lua .../Local/nvim-data/lazy/nvim-dap-ui/lua/dapui/controls.lua:14: attempt to index local 'element' (a nil value)
      -- see: https://github.com/rcarriga/nvim-dap-ui/issues/279#issuecomment-1596258077
      require('dapui').setup()
      -- uses the debugypy installation by mason
      local debugpyPythonPath = require('mason-registry').get_package('debugpy'):get_install_path() .. '/venv/bin/python3'
      require('dap-python').setup(debugpyPythonPath, {}) ---@diagnostic disable-line: missing-fields
    end,
  },
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.opt.timeoutlen
      delay = 0,
      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        { '<leader>d', group = '[D]ebugger' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>g', group = '[G]it' },
        { '<leader>h', group = '[H]arpoon' },
        { '<leader>p', group = '[P]ython' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>n', group = '[N]eotest' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>l', group = '[L]eetCode' },
      },
    },
  },

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by nvim-cmp
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>sl', require('telescope.builtin').lsp_document_symbols, '[D]ocument [l]ymbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
          map('<leader>cc', 'gcc<CR>', '[C]ode [C]omment', { 'n', 'x' })

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer some lsp support methods only in specific files
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
      -- setup pyright with completion capabilities
      require('lspconfig').pyright.setup {
        capabilities = capabilities,
        settings = {
          pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { '*' },
            },
          },
        },
      }

      -- ruff uses an LSP proxy, therefore it needs to be enabled as if it
      -- were a LSP. In practice, ruff only provides linter-like diagnostics
      -- and some code actions, and is not a full LSP yet.
      require('lspconfig').ruff.setup {
        -- disable ruff as hover provider to avoid conflicts with pyright
        on_attach = function(client)
          client.server_capabilities.hoverProvider = false
        end,
      }

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- gopls = {},
        ruff = {
          settings = {
            -- Ruff language server settings go here
          },
        },
        pyright = {
          settings = {
            pyright = {
              -- Using Ruff's import organizer
              disableOrganizeImports = true,
            },
            python = {
              analysis = {
                ignore = { '*' },
              },
            },
          },
        },
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`ts_ls`) will work just fine
        -- ts_ls = {},
        --

        lua_ls = {
          -- cmd = { ... },
          -- filetypes = { ... },
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --
      -- To check the current status of installed tools and/or manually install
      -- other tools, you can run
      --    :Mason
      --
      -- You can press `g?` for help in this menu.
      --
      -- `mason` had to be setup earlier: to configure its options see the
      -- `dependencies` table for `nvim-lspconfig` above.
      --
      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 5000,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        python = { 'isort', 'ruff_format' },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- If you prefer more traditional completion keymaps,
          -- you can uncomment the following lines
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          {
            name = 'lazydev',
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
          },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'nvim_lsp_signature_help' },
        },
      }
    end,
  },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    -- 'folke/tokyonight.nvim',
    'rose-pine/neovim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('rose-pine').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'rose-pine'
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes ''
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'python', 'query', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },

  -- The following comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  -- { import = 'custom.plugins' },
  --
  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- neotest
require('neotest').setup {
  adapters = {
    require 'neotest-python',
  },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
