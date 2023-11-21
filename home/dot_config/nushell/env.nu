# Nushell Environment Config File
#
# version = "0.86.0"

# # Environment
$env.BAT_THEME = "Catppuccin-macchiato"
$env.EDITOR    = "nvim"
$env.MANPAGER  = "less"

$env.LC_CTYPE = "en_US.UTF-8"
$env.LC_ALL   = "en_US.UTF-8"

$env.STARSHIP_SHELL = "nu"

$env.LS_COLORS = $"(dircolors)"

# ## Clean up HOME
if ("XDG_CONFIG_HOME" in $env) {
    $env.STARSHIP_CONFIG = ($env.XDG_CONFIG_HOME | path join "starship/config.toml")

    $env.CARGO_HOME  = ($env.XDG_DATA_HOME | path join "cargo")
    $env.RUSTUP_HOME = ($env.XDG_DATA_HOME | path join "rustup")

    $env.GTK2_RC_FILES = ($env.XDG_CONFIG_HOME | path join "gtk-2.0/gtkrc")
    $env.INPUTRC       = ($env.XDG_CONFIG_HOME | path join "readline/inputrc")
    $env.WINEPREFIX    = ($env.XDG_DATA_HOME | path join "wine")

    $env.XCURSOR_PATH = ["/usr/share/icons" ($env.XDG_DATA_HOME | path join "icons")]
} else {
    $env.STARSHIP_CONFIG = ($env.HOME | path join ".config/starship/config.toml")

    $env.CARGO_HOME  = ($env.HOME | path join ".local/share/cargo")
    $env.RUSTUP_HOME = ($env.HOME | path join ".local/share/rustup")

    $env.GTK2_RC_FILES = ($env.HOME | path join ".config/gtk-2.0/gtkrc")
    $env.INPUTRC       = ($env.HOME | path join ".config/readline/inputrc")
    $env.WINEPREFIX    = ($env.HOME | path join ".local/share/wine")

    $env.XCURSOR_PATH = ["/usr/share/icons" ($env.HOME | path join ".local/share/icons")]
}

$env.CARGO_BIN   = ($env.CARGO_HOME | path join "bin")

# ## Path
$env.PATH = ($env.PATH | split row (char esep) | prepend $env.CARGO_BIN)

# # Prompt
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu

# Set to nothing as to not conflict with Starship
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""
$env.PROMPT_MULTILINE_INDICATOR = ""

###

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
    "XCURSOR_PATH": {
        from_string: { |s| $s | split row (char esep) | path expand --no-symlink }
        to_string: { |v| $v | path expand --no-symlink | str join (char esep) }
    }
}

# Directories to search for scripts when calling source or use
$env.NU_LIB_DIRS = [
    ($nu.default-config-dir | path join 'scripts') # add <nushell-config-dir>/scripts
]

# Directories to search for plugin binaries when calling register
$env.NU_PLUGIN_DIRS = [
    ($nu.default-config-dir | path join 'plugins') # add <nushell-config-dir>/plugins
]
