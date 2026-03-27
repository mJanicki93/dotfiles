{{ if eq .chezmoi.os "linux" -}}
{{ if eq .chezmoi.osRelease.id "fedora" -}}
#!/bin/bash

sudo dnf copr enable solopasha/hyprland

# Lista pakietów do zainstalowania
packages=(
    git
    neovim
    tmux
    zsh
    htop
    task
    timew
    hyprland
    alacritty
    waybar
    wofi
    kubectl
    navi
    thefuck
    zsh
)

echo "Checking for missing packages on Fedora..."

sudo dnf install -y "${packages[@]}"

if command -v flatpak &> /dev/null; then
   sudo flatpak install flathub app.zen_browser.zen
   sudo flatpak install flathub md.obsidian.Obsidian
fi

# 2. Instalacja MesloLGS Nerd Font
FONT_DIR="$HOME/.local/share/fonts"
if [ ! -d "$FONT_DIR/MesloLGS" ]; then
    echo "Installing MesloLGS Nerd Font..."
    mkdir -p "$FONT_DIR/MesloLGS"
    
    # Linki do 4 podstawowych wariantów MesloLGS NF
    urls=(
        "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
        "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
        "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
        "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
    )

    for url in "${urls[@]}"; do
        curl -L "$url" -o "$FONT_DIR/MesloLGS/${url##*/}"
    done

    # Odświeżenie cache'u czcionek
    fc-cache -f
    echo "Fonts installed successfully."
else
    echo "MesloLGS Nerd Font already exists, skipping."
fi



sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

{{ end -}}
{{ end -}}
