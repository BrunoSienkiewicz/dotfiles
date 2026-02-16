require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = {}, -- Remove italic from comments for less distraction
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {
        mocha = {
            -- Bright, vibrant color palette
            rosewater = "#ffc9e0",
            flamingo = "#ffb3d9",
            pink = "#ff9ddb",
            mauve = "#d0a9ff",
            red = "#ff6b8a",
            maroon = "#ff8fab",
            peach = "#ffb380",
            yellow = "#ffe680",
            green = "#a6e3a1",
            teal = "#8ff0e0",
            sky = "#91d7ff",
            sapphire = "#82cfff",
            blue = "#96c9ff",
            lavender = "#c9beff",
        },
    }, -- Custom bright colors for enhanced visibility
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mason = true,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        telescope = {
            enabled = true,
        }
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
