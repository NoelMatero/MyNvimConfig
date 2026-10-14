# My Neovim Config (NvChad)

## Download

```
git clone https://github.com/NoelMatero/MyNvimConfig/ ~/.config/nvim && nvim
```
Be careful, once you get it working, dont update the dependencies or otherwise nvim will break apart hahaha

## Requirements

- Neovim 0.12+
- [`tree-sitter` CLI](https://github.com/tree-sitter/tree-sitter) (`brew install tree-sitter-cli`), a C compiler and Node.js, needed to build treesitter parsers.
  On first launch the parsers install in the background, so give it a minute before opening markdown or code files.

This is my personal [NvChad](https://nvchad.com/) configuration.  
It started as a copy of [ethan-davies/nvchad-config](https://github.com/ethan-davies/nvchad-config),  
with modifications to better fit my workflow and aesthetics.

# Added Features

I have modified the keybinds. This config uses the normal VSCode-like keybinds.
There are also more differences that are not worth mentioning.

# Pictures

Writing C++ code:

![](https://github.com/NoelMatero/MyNvimConfig/blob/main/pictures/cpp.png)

Writing Rust code:

![](https://github.com/NoelMatero/MyNvimConfig/blob/main/pictures/rust.png)

Writing JS code:

![](https://github.com/NoelMatero/MyNvimConfig/blob/main/pictures/js.png)

## License
This project is shared under the **MIT License**.  
Feel free to use it for learning, tinkering, or as inspiration for your own designs.  

## Debug
:lua require("lazy").load({ plugins = { "nvim-lspconfig" } })
