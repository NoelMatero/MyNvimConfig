# My Neovim Config (NvChad)

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
