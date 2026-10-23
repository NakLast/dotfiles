# 💤 Neovim Configuration

A modern, fast, and feature-rich Neovim configuration built on top of [LazyVim](https://www.lazyvim.org/) and [lazy.nvim](https://github.com/folke/lazy.nvim). Tailored for high-productivity development across Python, TypeScript/JavaScript, Go, .NET, Docker, SQL, and more, with native Wayland and Kitty terminal synergy.

---

## ✨ Features

- **⚡ Blazing Fast & Modular**: Powered by [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager with automated updates and on-demand loading.
- **🎨 Aesthetics**: [Catppuccin Mocha](https://github.com/catppuccin/nvim) with full transparency enabled, seamlessly matching the Kitty terminal palette.
- **📁 Snacks UI & Explorer**:
  - Right-aligned file explorer via [snacks.nvim](https://github.com/folke/snacks.nvim) (`<leader>e`).
  - Centered floating terminal (80% width/height with rounded borders).
  - Fast file and live-grep pickers (`<leader><space>` and `<leader>/`).
- **💬 Quiet & Clean Notifications**: [noice.nvim](https://github.com/folke/noice.nvim) filtering duplicate or uninformative LSP notifications with bordered documentation popups.
- **🤖 Integrated AI Assistant**: [antigravity.nvim](https://github.com/google-deepmind) companion integration for inline assistance, code explanation, and terminal interaction.
- **🧠 Full Language Ecosystem**:
  - **Python**: Pyright with automatic root `.venv` discovery, formatting via Black, and `venv-selector`.
  - **Web / Frontend**: TypeScript, OXC, Tailwind CSS, Prettier, and ESLint.
  - **Backend & Systems**: Go, .NET (OmniSharp), Docker, and SQL ([vim-dadbod](https://github.com/tpope/vim-dadbod) & UI).
  - **Config & Markup**: Markdown (live preview and rendered view), JSON (SchemaStore), TOML, and Dotfiles support.
- **📋 Enhanced Editing**:
  - History-aware yank manager ([yanky.nvim](https://github.com/gbprod/yanky.nvim)).
  - Incremental live LSP rename ([inc-rename.nvim](https://github.com/smjonas/inc-rename.nvim)).
  - Color and pattern highlighting with [mini-hipatterns](https://github.com/echasnovski/mini.hipatterns).
- **⏱️ Activity Tracking**: [vim-wakatime](https://github.com/wakatime/vim-wakatime) for automated coding metrics.
- **📝 Automated Spell Checking**: Automatic English spell check (`en_us`) enabled for `gitcommit`, `markdown`, and `text` files.

---

## 📋 Prerequisites

Before installing, ensure your system has the following dependencies:

### 1. Core Requirements
- **Neovim** >= `0.10.0` (Recommended) or >= `0.9.0`
- **Git** >= `2.19.0`
- **A [Nerd Font](https://www.nerdfonts.com/)** (v3.0+) (e.g., *JetBrainsMono Nerd Font*)
- **C Compiler**: `gcc` or `clang` (required for compiling Treesitter parsers)

### 2. Search & CLI Tools
- `ripgrep` (`rg`) - Fast file search and grep
- `fd` / `fdfind` - Fast directory traversal
- `lazygit` (optional, recommended for terminal git integration)

### 3. Language Runtimes & Package Managers
- **Node.js** >= `18.0.0` & `npm` (required for Mason LSPs and formatters such as Prettier, ESLint, Pyright)
- **Python 3** & `python3-venv` / `pip` (for Python formatting and virtual environments)

---

### Package Manager Quick Install

#### Ubuntu / Debian
```bash
sudo apt update
sudo apt install -y neovim git ripgrep fd-find build-essential python3 python3-venv python3-pip nodejs npm

# Symlink fdfind to fd if needed:
mkdir -p ~/.local/bin
ln -sf $(which fdfind) ~/.local/bin/fd
```

#### Arch Linux
```bash
sudo pacman -S neovim git ripgrep fd base-devel python nodejs npm lazygit
```

#### macOS (Homebrew)
```bash
brew install neovim git ripgrep fd node python lazygit
```

---

## 🚀 Installation & Setup

### 1. Backup Existing Configuration (Recommended)

If you have an existing Neovim configuration, back it up along with its state and cache:

```bash
mv ~/.config/nvim ~/.config/nvim.bak.$(date +%F)
mv ~/.local/share/nvim ~/.local/share/nvim.bak.$(date +%F)
mv ~/.local/state/nvim ~/.local/state/nvim.bak.$(date +%F)
mv ~/.cache/nvim ~/.cache/nvim.bak.$(date +%F)
```

### 2. Install via Dotfiles

From the root of your `dotfiles` repository:

```bash
# Symlink directly to ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim
```

Or using **GNU Stow**:
```bash
cd ~/dotfiles
stow nvim -t ~/.config/nvim
```

*(Alternatively, for a standalone installation, clone `https://github.com/NakLast/dotfiles.git` and link the `nvim` directory).*

### 3. Launch Neovim

```bash
nvim
```

On first launch:
1. `lazy.nvim` will automatically bootstrap and install all configured plugins.
2. Treesitter parsers will download and compile.
3. Mason will automatically install pre-configured language servers, linters, and formatters.

### 4. Verify Health

Check for any missing system tools or dependencies:

```vim
:checkhealth
```

---

## ⌨️ Custom Keybindings

Leader key is set to `<Space>`. Press `<leader>` and pause to view the interactive [which-key](https://github.com/folke/which-key.nvim) menu.

### Window Splits
| Key | Mode | Description |
| :--- | :--- | :--- |
| `ss` | Normal | Split window horizontally (`:split`) |
| `sv` | Normal | Split window vertically (`:vsplit`) |

### Buffer Switching (Kitty Synergy)
| Key | Mode | Description |
| :--- | :--- | :--- |
| `Ctrl` + `Shift` + `H` | Normal, Terminal | Switch to Previous Buffer (`bprevious` / `BufferLineCyclePrev`) |
| `Ctrl` + `Shift` + `L` | Normal, Terminal | Switch to Next Buffer (`bnext` / `BufferLineCycleNext`) |

> **Note on Kitty Synergy**: In `kitty/keymaps.conf`, `ctrl+shift+h` and `ctrl+shift+l` are explicitly mapped to `no_op` so Kitty forwards these keystrokes directly to Neovim for buffer switching.

### Buffer & Text Operations
| Key | Mode | Description |
| :--- | :--- | :--- |
| `<C-a>` | Normal | Select all text in current buffer (`gg<S-v>G`) |

### AI Assistant (Antigravity)
| Key | Mode | Description |
| :--- | :--- | :--- |
| `<leader>ag` | Normal | Toggle Antigravity assistant panel |
| `<leader>aa` | Visual | Send current selection to Antigravity |
| `<Esc><Esc>` | Terminal | Exit terminal mode to normal mode |

### Navigation & Explorer (Snacks.nvim)
| Key | Mode | Description |
| :--- | :--- | :--- |
| `<leader>e` | Normal | Toggle right-docked file explorer |
| `<leader><space>` | Normal | Find files (Snacks picker) |
| `<leader>/` | Normal | Live Grep across project |

---

## 📂 Repository Structure

```text
nvim/
├── init.lua                 # Entrypoint (bootstraps lazy.nvim)
├── lazyvim.json             # Enabled LazyVim extras and version info
├── lazy-lock.json           # Pinned plugin commits for reproducible setups
├── stylua.toml              # Lua code formatting configuration
├── .neoconf.json            # Neoconf local configuration
└── lua/
    ├── config/
    │   ├── autocmds.lua     # Autocommands (e.g. spellcheck on git/markdown)
    │   ├── keymaps.lua      # Custom key mappings (splits, buffer switches, select-all)
    │   ├── lazy.lua         # lazy.nvim setup, Catppuccin Mocha default, plugin disables
    │   └── options.lua      # General vim options (terminal undercurl escape codes)
    └── plugins/
        ├── antigravity.lua  # Antigravity AI companion integration
        ├── colorsheme.lua   # Catppuccin theme transparency override
        ├── noice.lua        # UI notification filters and bordered LSP docs
        ├── python.lua       # Pyright LSP with automatic .venv discovery
        ├── ui.lua           # Snacks.nvim explorer and floating terminal setup
        └── wakatime.lua     # WakaTime automated coding metrics
```

---

## 🧩 Managing Plugins & Extras

### Plugin Operations
- `:Lazy` — Open the lazy.nvim interactive dashboard.
- `:Lazy update` — Update all installed plugins.
- `:Lazy clean` — Clean unused plugins.

### Toggling LazyVim Extras
Extras can be enabled or disabled interactively:
- `:LazyExtras` — Open the extras manager. Navigate with `j`/`k` and press `x` to toggle extras.

### Language Servers & Formatters (Mason)
- `:Mason` — Manage language servers, formatters, and linters.
- `:MasonUpdate` — Update Mason registries.

---

## 🔧 Notes & Troubleshooting

- **Python Virtualenv**: Pyright is configured to automatically discover `.venv` at project root (`venvPath = "."`, `venv = ".venv"`). Create your environment in the project directory using `python3 -m venv .venv`.
- **Antigravity CLI**: `lua/plugins/antigravity.lua` launches `agy` via `antigravity.nvim`. Ensure `agy` is installed and accessible in your `$PATH`.
- **Terminal Undercurl**: `lua/config/options.lua` defines undercurl escape sequences (`&t_Cs` and `&t_Ce`). Paired with Kitty terminal, undercurl diagnostics display with native curly underlines.
- **WakaTime API Key**: On your first file save, `vim-wakatime` will prompt for your API key if `~/.wakatime.cfg` is not yet configured.

---

## 📄 License

This configuration is open-source and part of the [NakLast dotfiles](https://github.com/NakLast/dotfiles) repository.
