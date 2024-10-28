-- Set session options to include 'localoptions'
-- vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Load Lazy.nvim plugin manager configuration
require("config.lazy")

-- Set colorscheme
vim.cmd([[colorscheme tokyonight]])

-- General Neovim Settings (can be expanded as needed)

-- Key mappings

-- nvim-tree toggle
vim.keymap.set('n', '<Space>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Telescope find --[[ file ]]s
vim.keymap.set('n', '<Space>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })

-- Telescope live grep (search inside files)
vim.keymap.set('n', '<Space>fg', ':Telescope live_grep<CR>', { noremap = true, silent = true })

-- Telescope buffers (switch between open files)
vim.keymap.set('n', '<Space>fb', ':Telescope buffers<CR>', { noremap = true, silent = true })

-- Telescope oldfiles (recent files)
vim.keymap.set('n', '<Space>fh', ':Telescope oldfiles<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<Space>fr', ':Telescope frecency<CR>', { noremap = true, silent = true })
-- Telescope file browser 
vim.keymap.set('n', '<Space>fe', ':Telescope file_browser<CR>', { noremap = true, silent = true })

-- Toggleterm
vim.keymap.set('n', '<Space>tt', ':ToggleTerm<CR>', { noremap = true, silent = true })


-- Tab navigation
vim.keymap.set('n', '<Tab>', ':tabnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', ':tabprevious<CR>', { noremap = true, silent = true })

-- Yank to the system clipboard with <leader>y
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })

-- Paste from the system clipboard with <leader>p
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>p', '"+p', { noremap = true, silent = true })


-- Map Alt + Left Arrow to go back in the jump list (equivalent to Ctrl-o)
vim.keymap.set('n', '<A-Left>', '<C-o>', { noremap = true, silent = true })

-- Map Alt + Right Arrow to go forward in the jump list (equivalent to Ctrl-i)
vim.keymap.set('n', '<A-Right>', '<C-i>', { noremap = true, silent = true })


-- Indent and reselect the text
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })


-- Save session manually
vim.keymap.set('n', '<leader>ss', ':lua require("persistence").save()<CR>', { noremap = true, silent = true })

-- Restore the last session
vim.keymap.set('n', '<leader>sl', ':lua require("persistence").load()<CR>', { noremap = true, silent = true })

-- Restore the session for the current directory
vim.keymap.set('n', '<leader>sd', ':lua require("persistence").load({ last = true })<CR>', { noremap = true, silent = true })

local dap = require("dap")
vim.keymap.set("n", "<F5>", dap.continue)
vim.keymap.set("n", "<F10>", dap.step_over)
vim.keymap.set("n", "<F11>", dap.step_into)
vim.keymap.set("n", "<F12>", dap.step_out)
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint)
