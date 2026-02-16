local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- Python snippets
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
	s(
		"pytest",
		fmt(
			[[
    def test_{}():
        {}
    ]],
			{ i(1, "function"), i(0) }
		)
	),
	s(
		"fixture",
		fmt(
			[[
    @pytest.fixture
    def {}():
        {}
    ]],
			{ i(1, "name"), i(0) }
		)
	),
	s(
		"dataclass",
		fmt(
			[[
    @dataclass
    class {}:
        {}: {}
    ]],
			{ i(1, "ClassName"), i(2, "field"), i(3, "str") }
		)
	),
	s(
		"typehint",
		fmt(
			[[
    def {}({}: {}) -> {}:
        {}
    ]],
			{ i(1, "function"), i(2, "arg"), i(3, "str"), i(4, "None"), i(0) }
		)
	),
	s(
		"class",
		fmt(
			[[
    class {}:
        def __init__(self, {}):
            {}
    ]],
			{ i(1, "ClassName"), i(2, "args"), i(0, "self.args = args") }
		)
	),
	s(
		"logger",
		fmt(
			[[
    import logging

    logger = logging.getLogger(__name__)
    {}
    ]],
			{ i(0) }
		)
	),
	s(
		"typing",
		fmt(
			[[
    from typing import {}
    ]],
			{ i(0, "List, Dict, Optional, Union") }
		)
	),
})

-- Go snippets
ls.add_snippets("go", {
	s(
		"iferr",
		fmt(
			[[
    if err != nil {{
        {}
    }}
    ]],
			{ i(0, "return err") }
		)
	),
	s(
		"test",
		fmt(
			[[
    func Test{}(t *testing.T) {{
        {}
    }}
    ]],
			{ i(1, "Function"), i(0) }
		)
	),
	s(
		"table",
		fmt(
			[[
    tests := []struct {{
        name string
        {}
    }}{{
        {{
            name: "{}",
            {},
        }},
    }}
    for _, tt := range tests {{
        t.Run(tt.name, func(t *testing.T) {{
            {}
        }})
    }}
    ]],
			{ i(1, "input string"), i(2, "test case"), i(3, "input: \"test\""), i(0) }
		)
	),
})

-- YAML snippets (minimal K8s support)
ls.add_snippets("yaml", {
	s(
		"deployment",
		fmt(
			[[
    apiVersion: apps/v1
    kind: Deployment
    metadata:
      name: {}
    spec:
      replicas: {}
      selector:
        matchLabels:
          app: {}
      template:
        metadata:
          labels:
            app: {}
        spec:
          containers:
          - name: {}
            image: {}
            ports:
            - containerPort: {}
    ]],
			{ i(1, "app-name"), i(2, "3"), i(3, "app"), i(4, "app"), i(5, "container"), i(6, "image:tag"), i(0, "8080") }
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
