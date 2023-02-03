# zsh-nvrepl

Let Zsh acts as if a REPL of Neovim's Ex-command.

Zsh runs commands starting with `:` as Ex-command on Neovim, receives the output and echoes it.

Watch the following demo which runs Zsh on Neovim's terminal.

https://user-images.githubusercontent.com/30277794/216598210-c9502a8b-a05e-4ab3-8e43-e446bb452f79.mp4

## Requirements

- [Neovim](https://github.com/neovim/neovim)
- [neovim-remote](https://github.com/mhinz/neovim-remote)

## Setup

Source the following script.
Then, <kbd>Enter</kbd> will run Ex-command if the Zsh's buffer starts with `:` and `$NVIM` is set by the parent Neovim.
Otherwise, the buffer is interpreted ordinarily.

``` bash
source nvrepl.plugin.zsh # or use plugin managers you like

if [[ -n "$NVIM" ]]; then
    bindkey '^m' nvrepl-or-accept-line
fi
```

If you want to customize the behavior of `nvr` (neovim-remote), then define `nvrepl-nvr` function.
This function should receive the `--remote-expr` parameter.

For example, the function below allows modifying the address that Neovim listens to.
This might be useful when attaching external Zsh as a Neovim's REPL.

``` bash
function nvrepl-nvr() {
    nvr --servername "your neovim server" "$@"
}
```
