local pam = vim.keymap.del
pam("n", "<C-L>")
pam("n", "<S-L>")
pam("n", "<S-H>")

local map = vim.keymap.set
map("n", "<leader>ww", "<cmd>w<cr><esc>", { desc = "Save File" })
map("n", "<leader>q", "<cmd>bd<cr><esc>", { desc = "Close Current Buffer" })
map("n", "gl", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "gh", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<C-L>", "<cmd>!/usr/bin/php -l %<cr>", { desc = "PHP Synctax Check" })
map("n", "<C-F>", "<cmd>!/usr/bin/php -f %<cr>", { desc = "Execute PHP Code" })
map("n", "<F2>", "<cmd>set paste!<CR><cmd>set paste?<CR>", { desc = "set paste" })
local mouse_enabled = true
-- 创建一个切换鼠标状态的函数
local function toggle_mouse()
  mouse_enabled = not mouse_enabled
  if mouse_enabled then
    vim.opt.mouse = "a" -- 启用鼠标
    vim.notify("Mouse enabled")
  else
    vim.opt.mouse = "" -- 禁用鼠标
    vim.notify("Mouse disabled")
  end
end

-- 使用 vim.keymap.set 映射快捷键（例如 <Leader>m）来切换鼠标状态
map("n", "<Leader>m", toggle_mouse, { desc = "Toggle Mouse" })

local function buf_get_name()
  print(vim.api.nvim_buf_get_name(0))
end

map("n", "<Leader>p", buf_get_name, { desc = "Gets the full file name for the actived buffer" })
