# 🛠️ NakLast Dotfiles

Personal dotfiles and environment configurations tailored for a sleek, unified, and high-performance Linux and Wayland desktop experience.

Built with a consistent aesthetic using the **Catppuccin Mocha** palette, **JetBrainsMono Nerd Font**, and coordinated keybindings across all tools.

---

## 📂 Repository Structure

```text
.
├── kitty/                   # Kitty terminal configuration
│   ├── kitty.conf           # Main configuration (fonts, window, cursor, tabs)
│   ├── catppuccin-mocha.conf# Catppuccin Mocha color palette
│   ├── keymaps.conf         # Custom keybindings & passthrough mappings
│   └── README.md            # Detailed Kitty documentation
├── nvim/                    # Neovim (LazyVim) IDE configuration
│   ├── init.lua             # Entrypoint bootstrapping lazy.nvim
│   ├── lazyvim.json         # Enabled LazyVim extras and version lock
│   ├── lazy-lock.json       # Pinned plugin commits for reproducible setups
│   ├── stylua.toml          # Lua code formatting configuration
│   ├── .neoconf.json        # Neoconf local configuration
│   ├── lua/                 # Config modules and plugin specifications
│   └── README.md            # Detailed Neovim documentation
└── README.md                # Repository index & setup guide (this file)
```

---

## 📦 Modules

| Module | Description | Documentation |
| :--- | :--- | :--- |
| **🐱 Kitty** | Fast, GPU-accelerated terminal with custom top powerline tabs, cursor trail effects, window blur, and opacity. | [kitty/README.md](kitty/README.md) |
| **💤 Neovim** | Modern LazyVim-based development environment with LSP, Snacks.nvim explorer, Antigravity AI assistant, and rich language support. | [nvim/README.md](nvim/README.md) |

---

## 🎨 Unified Design System & Synergy

All configurations are crafted to work together harmoniously:

- **Theme Palette**: [Catppuccin Mocha](https://github.com/catppuccin) is applied across both Kitty and Neovim with matching background opacity (`0.85`) and blur.
- **Typography**: [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads) is standardized for consistent glyphs and icons.
- **Keyboard Synergy**:
  - `Ctrl + Shift + H` & `Ctrl + Shift + L` are disabled (`no_op`) in `kitty/keymaps.conf` so the keystrokes pass directly to Neovim to switch buffers seamlessly.
  - Native undercurl escape codes enabled in Neovim display curly diagnostic underlines in Kitty.

---

## 📋 Prerequisites

To run these configurations, ensure the following core tools are installed:

- **Terminal**: [Kitty Terminal](https://sw.kovidgoyal.net/kitty/)
- **Editor**: [Neovim](https://neovim.io/) >= `0.10.0`
- **Font**: [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads) (v3.0+)
- **System Tools**: `git`, `ripgrep`, `fd-find`, `build-essential` / `gcc`
- **Runtimes**: Node.js (>= 18), Python 3 & `python3-venv`

### Quick Install (Ubuntu / Debian)
```bash
sudo apt update
sudo apt install -y kitty neovim git ripgrep fd-find build-essential python3 python3-venv nodejs npm stow
```

---

## 🚀 Installation & Setup

### 1. Clone the Repository
```bash
git clone https://github.com/NakLast/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Manage Configurations

#### Method A: Using GNU Stow (Recommended)
Stow creates and manages symlinks automatically:

```bash
# Link Kitty configuration
mkdir -p ~/.config/kitty
stow kitty -t ~/.config/kitty

# Link Neovim configuration
mkdir -p ~/.config/nvim
stow nvim -t ~/.config/nvim
```

#### Method B: Direct Symbolic Links
Alternatively, create manual symlinks to `~/.config`:

```bash
# Backup existing configs if present
[ -d ~/.config/kitty ] && mv ~/.config/kitty ~/.config/kitty.bak.$(date +%F)
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak.$(date +%F)

# Create symlinks
ln -s ~/dotfiles/kitty ~/.config/kitty
ln -s ~/dotfiles/nvim ~/.config/nvim
```

### 3. Launch & Verify
- **Kitty**: Launch Kitty or reload an existing session with `Ctrl + Shift + F5`.
- **Neovim**: Open `nvim`. Plugins and Tree-sitter parsers will bootstrap automatically on first launch. Run `:checkhealth` to verify tool installations.

---

## 📌 Roadmap
- [ ] Shell configuration (`zsh` / `fish` with Starship prompt)
- [ ] Wayland Compositor / Window Manager (`Hyprland` / `Waybar`)
- [ ] Terminal multiplexer (`tmux` / `zellij`)
- [ ] Git & Lazygit configuration

---

## 📄 License
This repository is open-source and released under the [MIT License](LICENSE).
