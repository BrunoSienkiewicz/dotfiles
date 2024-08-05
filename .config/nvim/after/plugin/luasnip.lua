local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("python", {
	s(
		"__main__",
		fmt(
			[[
    if __name__ == "__main__":
      {}
    ]],
			{ i(0) }
		)
	),
})

vim.keymap.set({ "i", "s" }, "<A-l>", function()
	if ls.jumpable(1) then
		ls.jump(1)
	end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<A-h>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })
