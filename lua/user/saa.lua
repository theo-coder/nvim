local status_ok, saa = pcall(require, "saa")
if not status_ok then
	return
end

saa.setup()

vim.cmd([[ cnoreabbrev w Saa ]])
vim.cmd([[ cnoreabbrev wq SaaQ ]])
