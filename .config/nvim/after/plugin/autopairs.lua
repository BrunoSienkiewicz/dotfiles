require("nvim-autopairs").setup({
	fast_wrap = {
		map = "<a-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = [=[[%'%"%>%]%)%}%,]]=],
		end_key = "$",
		before_key = "h",
		after_key = "l",
		cursor_pos_before = true,
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		manual_position = true,
		highlight = "Search",
		highlight_grey = "Comment",
	},
})
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
