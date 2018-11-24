# Tmux memory status

Enables displaying memory information in Tmux `status-right` and `status-left`.
Configurable percentage and icon display.

## Installation
### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'laomafeima/tmux-mem'

Hit `prefix + I` to fetch the plugin and source it.

If format strings are added to `status-right`, they should now be visible.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/laomafeima/tmux-mem ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/mem.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

If format strings are added to `status-right`, they should now be visible.

### Requirement

`free` is required for memory information.

## Usage

Add any of the supported format strings (see below) to the existing `status-right` tmux option.
Example:

    # in .tmux.conf
    set -g status-right '#{mem_bg_color} MEM: #{mem_icon} #{mem_percentage}'

### Supported Options

This is done by introducing 4 new format strings that can be added to
`status-right` option:

 - `#{mem_icon}` - will display a memory status icon
 - `#{mem_percentage}` - will show memory percentage (averaged across cores)
 - `#{mem_bg_color}` - will change the background color based on the memory percentage
 - `#{mem_fg_color}` - will change the foreground color based on the memory percentage

## Changing default

By default, these icons are displayed:

 - low: "="
 - medium: "≡"
 - high: "≣"

And these colors are used:

 - low: `#[fg=green]` `#[bg=green]`
 - medium: `#[fg=yellow]` `#[bg=yellow]`
 - high: `#[fg=red]` `#[bg=red]`

Note that these colors depend on your terminal / X11 config.

You can change these defaults by adding the following to `.tmux.conf`:

```
set -g @mem_low_icon "ᚋ"
set -g @mem_medium_icon "ᚌ"
set -g @mem_high_icon "ᚍ"

set -g @mem_low_fg_color "#[fg=#00ff00]"
set -g @mem_medium_fg_color "#[fg=#ffff00]"
set -g @mem_high_fg_color "#[fg=#ff0000]"

set -g @mem_low_bg_color "#[bg=#00ff00]"
set -g @mem_medium_bg_color "#[bg=#ffff00]"
set -g @mem_high_bg_color "#[bg=#ff0000]"
```

Don't forget to reload tmux environment (`$ tmux source-file ~/.tmux.conf`)
after you do this.

### Acknowledgements

This project refers to the implementation of [tmux-cpu](https://github.com/tmux-plugins/tmux-cpu), and I would like to express my gratitude.  
Thanks [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) great program.

### License

[MIT](LICENSE.md)
