-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- ESC to jj for quick NORMAL mode
vim.keymap.set("i", "jj", "<ESC>", { silent = true })

-- Helper: Find the nearest enclosing function name above the current line
local function get_enclosing_function_name(line_num)
  for i = line_num, 1, -1 do
    local line = vim.fn.getline(i)
    local found = line:match("function%s+([%w_]+)")
      or line:match("const%s+([%w_]+)%s*=%s*%(.+%)%s*=>")
      or line:match("([%w_]+)%s*=%s*async%s*%(.+%)")
    if found then
      return found
    end
  end
  return "anonymous"
end

-- Helper: Find line number to insert after current statement/block
local function find_insert_line(start_line)
  local last_line = vim.fn.line("$")
  local line_num = start_line

  while line_num <= last_line do
    local line = vim.fn.getline(line_num)
    -- Break on empty line or line that ends with semicolon or closing brace, or arrow function block start
    if line:match("^[^,{]*[;}]%s*$") or line:match("^%s*$") or line:match("=>%s*{") then
      break
    end
    line_num = line_num + 1
  end

  return line_num
end

-- Main function to insert turbo console log
local function insert_console_log(variable, current_line_num)
  local current_line = vim.fn.getline(current_line_num)
  local indent = current_line:match("^%s*") or ""

  local function_name = get_enclosing_function_name(current_line_num)

  local log_line = indent .. string.format('console.log("🚀 ~ %s ~ %s:", %s);', function_name, variable, variable)

  local insert_line = find_insert_line(current_line_num)

  vim.api.nvim_buf_set_lines(0, insert_line, insert_line, false, { log_line })
end

-- Normal mode keymap: log word under cursor
vim.keymap.set("n", "<C-M-l>", function()
  local variable = vim.fn.expand("<cword>")
  local current_line_num = vim.api.nvim_win_get_cursor(0)[1]
  insert_console_log(variable, current_line_num)
end, { desc = "Turbo Console Log (Normal Mode)", noremap = true, silent = true })

-- Visual mode keymap: log selected text
vim.keymap.set("v", "<C-M-l>", function()
  -- Save and restore register
  local saved_reg = vim.fn.getreg('"')
  vim.cmd('normal! ""y') -- yank visual selection to default register
  local variable = vim.fn.getreg('"')
  vim.fn.setreg('"', saved_reg)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", false)

  local current_line_num = vim.api.nvim_win_get_cursor(0)[1]
  insert_console_log(variable, current_line_num)
end, { desc = "Turbo Console Log (Visual Mode)", noremap = true, silent = true })
