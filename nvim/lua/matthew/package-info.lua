local status_ok, packageInfo = pcall(require, "package-info")
if not status_ok then
	return
end

packageInfo.setup({})
