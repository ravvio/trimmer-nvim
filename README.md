
# Trimmer Nvim
A simple neovim plugin that trims trailing whitespaces before writing the
buffer to file.

## Commands

| Command          | Action                        |
| :--------------- | :---------------------------- |
| `TrimmerToggle`  | Enable or disable autocommand |
| `TrimmerTrim`    | Manually trim current buffer  |

## Setup

With defaults:
```lua
{
    "ravvio/trimmer-nvim",
    config = function ()
        require("trimmer-nvim").setup({})
    end
}
```

or with options (here defaults are shown):
```lua
{
    "ravvio/trimmer-nvim",
    config = function ()
        require("trimmer-nvim").setup({
            -- enable / disable autocommand at startup
            enabled = true,
            -- events in which to set the autocommand
            events = { "BufWritePre" }
            -- filetypes in which the trimmer will not be run
            -- like `markdown` or `lua`
            exclude = { }
        })
    end
}
```
