# 🐱 Kitty Terminal Configuration

A fast, feature-rich, and aesthetically customized [Kitty](https://sw.kovidgoyal.net/kitty/) terminal setup configured for Linux and Wayland, featuring the [Catppuccin Mocha](https://github.com/catppuccin/kitty) theme, modern cursor trail effects, and seamless keymap synergy with Neovim.

---

## 📂 Directory Structure

```text
kitty/
├── kitty.conf            # Main configuration file (fonts, window, tabs, cursor)
├── catppuccin-mocha.conf # Catppuccin Mocha color palette
├── keymaps.conf          # Custom keybindings & passthrough mappings
└── README.md
```

---

## ✨ Features & Visual Styling

### 🎨 Colors & Aesthetics
- **Theme**: [Catppuccin Mocha](https://github.com/catppuccin/kitty) included via `catppuccin-mocha.conf`.
- **Transparency & Blur**:
  - Background opacity set to `0.85` (`background_opacity 0.85`).
  - Dynamic background blur enabled at strength `32` (`background_blur 32`).
- **Clean Window Layout**:
  - Borderless window with hidden window decorations (`hide_window_decorations yes`).
  - Centered window placement strategy (`placement_strategy center`).
  - Window padding: `4px` top/bottom, `8px` left/right (`window_padding_width 4 8`).
  - Suppressed OS window close confirmation (`confirm_os_window_close -1`).

### 🔤 Typography
- **Font Family**: `JetBrainsMono Nerd Font` with automatic bold/italic matching.
- **Font Size**: `10.0pt`.
- **Hyperlinks**: Curly underline style (`url_style curly`) with hover underline (`underline_hyperlinks hover`).

### ✨ Cursor & Trail Effects
- **Cursor Shape**: Smooth vertical beam (`cursor_shape beam`).
- **Blinking**: Gentle ease-in-out pulsing (`cursor_blink_interval 0.5 ease-in-out`).
- **Cursor Trail**: Animated trailing effect enabled (`cursor_trail 1`, decay `0.1 0.35`, start threshold `2`).
- **Scrollback**: Expanded history of `10000` lines (`scrollback_lines 10000`).

### 📑 Tab Bar
- **Position**: Top of the window (`tab_bar_edge top`).
- **Style**: Powerline with rounded dividers (`tab_bar_style powerline`, `tab_powerline_style round`).
- **Alignment**: Left-aligned (`tab_bar_align left`) with separator `" ┇"`.
- **Activity Indicator**: Bell alert badge `🔔 ` displayed on tabs when an alert fires (`bell_on_tab "🔔 "`).

### ⚙️ System & Wayland Integration
- **Display Server**: Wayland protocol native (`linux_display_server wayland`).
- **Remote Control**: Enabled (`allow_remote_control yes`) for programmatic window and tab interaction.
- **Shell Integration**: Enabled (`shell_integration enabled`).
- **Terminal Identification**: `term xterm-kitty`.

---

## ⌨️ Keybindings

Configured in [`keymaps.conf`](keymaps.conf):

### Clipboard
| Action | Keybinding |
| :--- | :--- |
| **Copy to Clipboard** | `Ctrl` + `Shift` + `C` |
| **Paste from Clipboard** | `Ctrl` + `Shift` + `V` |

### Tabs & Layouts
| Action | Keybinding |
| :--- | :--- |
| **Select / Switch Tab** | `Ctrl` + `Shift` + `Space` |
| **Cycle Window Layout** | `Ctrl` + `Alt` + `L` |

### Window Resizing
| Action | Keybinding |
| :--- | :--- |
| **Resize Narrower** | `Ctrl` + `Alt` + `Left` |
| **Resize Wider** | `Ctrl` + `Alt` + `Right` |
| **Resize Taller** | `Ctrl` + `Alt` + `Up` |
| **Resize Shorter** | `Ctrl` + `Alt` + `Down` |

### 🔄 Neovim Keymap Passthrough
| Keybinding | Mapping | Purpose |
| :--- | :--- | :--- |
| `Ctrl` + `Shift` + `H` | `no_op` | Disabled in Kitty so keystroke passes directly to Neovim (`bprevious`) |
| `Ctrl` + `Shift` + `L` | `no_op` | Disabled in Kitty so keystroke passes directly to Neovim (`bnext`) |

---

## 🚀 Installation & Setup

### Prerequisites
- [Kitty Terminal](https://sw.kovidgoyal.net/kitty/)
- [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)

### 1. Clone Dotfiles
If not already cloned:
```bash
git clone https://github.com/NakLast/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Symlink Configuration
Backup any existing Kitty configuration directory and create a symlink:

```bash
# Backup existing config if present
[ -d ~/.config/kitty ] && mv ~/.config/kitty ~/.config/kitty.backup.$(date +%F)

# Create symlink
ln -s ~/dotfiles/kitty ~/.config/kitty
```

Or using **GNU Stow**:
```bash
cd ~/dotfiles
stow kitty -t ~/.config/kitty
```

### 3. Reload Configuration
While running Kitty, press:
```
Ctrl + Shift + F5
```
to reload the configuration instantly without restarting active shells.

---

## 🔗 Related Configurations
- [Neovim Configuration](../nvim/README.md) — LazyVim-based Neovim setup sharing Catppuccin Mocha styling and buffer-switching bindings.
