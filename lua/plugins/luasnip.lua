return {
	"L3MON4D3/LuaSnip",
	dependencies = { "golang/vscode-go" },
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
