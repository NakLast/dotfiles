# 🛠️ Dotfiles

Personal dotfiles and environment configurations tailored for a sleek, efficient Linux and Wayland desktop experience.

---

## 📂 Repository Structure

```text
.
├── kitty/
│   ├── kitty.conf            # Main Kitty terminal configuration
│   ├── catppuccin-mocha.conf # Catppuccin Mocha color palette
│   └── keymaps.conf          # Custom keybindings & shortcuts
└── README.md
```

---

## ✨ Features

### 🐱 Kitty Terminal
- **Theme**: [Catppuccin Mocha](https://github.com/catppuccin/kitty) pastel color palette.
- **Font**: JetBrainsMono Nerd Font (size 10.0).
- **Appearance**:
  - Borderless window with hidden window decorations.
  - Background transparency (`opacity 0.85`) with blur (`blur 32`).
  - Window padding: `4px 8px` with centered placement.
- **Cursor Effects**:
  - Smooth beam cursor (`0.5 ease-in-out` blink).
  - Modern cursor trail enabled (`cursor_trail 1`).
- **Tab Bar**:
  - Positioned at the top (`tab_bar_edge top`).
  - Rounded powerline tabs with visual bell notifications (`🔔`).
- **Wayland Native**: Optimized display protocol for Wayland sessions.

---

## ⌨️ Custom Keybindings

Key mappings configured in [`kitty/keymaps.conf`](kitty/keymaps.conf):

| Action | Keybinding |
| :--- | :--- |
| **Copy to Clipboard** | `Ctrl` + `Shift` + `C` |
| **Paste from Clipboard** | `Ctrl` + `Shift` + `V` |
| **Switch Tabs** | `Ctrl` + `Shift` + `Space` |
| **Next Window Layout** | `Ctrl` + `Alt` + `L` |
| **Resize: Narrower** | `Ctrl` + `Alt` + `Left` |
| **Resize: Wider** | `Ctrl` + `Alt` + `Right` |
| **Resize: Taller** | `Ctrl` + `Alt` + `Up` |
| **Resize: Shorter** | `Ctrl` + `Alt` + `Down` |

*(Note: `Ctrl+Shift+H` and `Ctrl+Shift+L` are disabled to avoid collisions)*

---

## 🚀 Installation & Setup

### Prerequisites
- [Kitty Terminal](https://sw.kovidgoyal.net/kitty/)
- [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)

### 1. Clone Repository
```bash
git clone https://github.com/your-username/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Symlink Configuration
Backup any existing Kitty configuration and link the directory:

```bash
# Backup existing config if present
[ -d ~/.config/kitty ] && mv ~/.config/kitty ~/.config/kitty.backup.$(date +%F)

# Create symlink
ln -s ~/dotfiles/kitty ~/.config/kitty
```

Or using **GNU Stow**:
```bash
stow kitty -t ~/.config/kitty
```

### 3. Reload Kitty
Press `Ctrl + Shift + F5` inside Kitty to reload the configuration without restarting the terminal.

---

## 📌 Future Configurations
- [ ] Shell configuration (`zsh` / `bash` / `fish`)
- [ ] Window manager / compositor (`Hyprland` / `Sway` / `i3`)
- [ ] Neovim / editor config
- [ ] Multiplexer (`tmux` / `zellij`)
