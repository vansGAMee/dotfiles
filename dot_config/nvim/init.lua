-- ==========================================
-- Простейшая подсветка Python (работает 100%)
-- ==========================================

-- Включаем подсветку синтаксиса
vim.cmd("syntax on")

-- Включаем определение типа файла (для .py)
vim.cmd("filetype plugin indent on")

-- Устанавливаем цветовую схему (встроенная, красивая)
vim.cmd("colorscheme desert")
vim.opt.background = "dark"

-- Автоматически включаем python режим для .py файлов
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.py",
  callback = function()
    vim.bo.filetype = "python"
    vim.cmd("syntax on")
  end,
})

print("✅ Подсветка Python включена. Открой .py файл.")
