-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    -- Keybinding for <leader>x to run C++ code
    vim.keymap.set("n", "<D-'>", function()
      local filename = vim.fn.expand("%") -- Get the current file name
      local output_name = filename:gsub(".cpp$", "") -- Remove '.cpp' to name the output binary

      -- Compile and run the C++ file
      -- Compile the code with g++ and output the binary as `a.out` or using the output_name
      local compile_cmd = string.format(
        ":TermExec cmd='g++ -std=c++23 %s -o %s && ./%s && rm ./%s'",
        filename,
        output_name,
        output_name,
        output_name
      )

      vim.cmd(compile_cmd)
      vim.cmd(":wincmd p")

      vim.cmd(":startinsert")
    end, { noremap = true, silent = true, desc = "E[X]ecute [R]un Code" })
    vim.keymap.set("n", "<C-D-'>", function()
      local filepath = vim.fn.expand("%:p:h") -- Get the current file name
      local filename = vim.fn.expand("%")
      local output_name = filename:gsub(".cpp$", "") -- Remove '.cpp' to name the output binary

      -- Compile and run the C++ file
      -- Compile the code with g++ and output the binary as `a.out` or using the output_name
      local compile_cmd = string.format(
        ":TermExec cmd='g++ -std=c++23 %s/*.cpp -o %s && ./%s && rm ./%s'",
        filepath,
        output_name,
        output_name,
        output_name
      )

      vim.cmd(compile_cmd)
      vim.cmd(":wincmd p")

      vim.cmd(":startinsert")
    end, { noremap = true, silent = true, desc = "E[X]ecute [C]ompile Project" })
  end,
})
