-- 设置空格为leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 开启或关闭neo-tree
vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle NeoTree' })

-- 切换焦点到 neo-tree
vim.keymap.set('n', '<C-h>', ':Neotree focus<CR>', { desc = 'Focus on NeoTree' })

-- 切换焦点到编辑区
vim.keymap.set('n', '<C-l>', ':wincmd p<CR>', { desc = 'Focus on editor' })
