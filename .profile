
[ "$PROFILE_LOADED" -eq 1 ] || {
    export PROFILE_LOADED=1

    export EDITOR=/usr/bin/nvim
    export VISUAL=/usr/bin/nvim
    export TERMINAL=/usr/bin/foot
    export BROWSER=firefox

    export QT_QPA_PLATFORMTHEME="qt5ct"
    export QT_AUTO_SCREEN_SCALE_FACTOR=0

    export XDG_CONFIG_DIRS=/etc/xdg
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_CACHE_HOME="$HOME/.cache"
    export XDG_DATA_HOME="$HOME/.local/share"

    export MOZ_ENABLE_WAYLAND=1

    export XKB_DEFAULT_LAYOUT="cz"
    export XKB_DEFAULT_VARIANT="coder"

    export PATH="$PATH:$HOME/.local/bin:$HOME/.cabal/bin:$HOME/.ghcup/bin:$HOME/.cargo/bin:$HOME/scripts:$HOME/.composer/vendor/bin:$HOME/go/bin"
    export PATH="$PATH:$HOME/projects/cp/ksp/ksp-klient"
    eval $(opam env)
}
