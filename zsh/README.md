# 🐚 Zsh Configuration

Fast, rich, and responsive Zsh shell environment configured with [Oh My Zsh](https://ohmyz.sh/), the [Powerlevel10k](https://github.com/romkatv/powerlevel10k) prompt, syntax highlighting, autosuggestions, and modern CLI tool integrations.

---

## 📂 Directory Structure

```text
zsh/
├── .zshrc       # Main Zsh configuration (Oh My Zsh, plugins, aliases, tool paths)
├── .p10k.zsh    # Powerlevel10k prompt theme customization
├── .zshenv      # Early-stage environment variables (Cargo, Go)
└── README.md    # Zsh module documentation (this file)
```

---

## ✨ Features

- **⚡ Instant Prompt**: Powerlevel10k instant prompt configured at the top of `.zshrc` for near-zero latency startup.
- **🎨 Theme**: [Powerlevel10k](https://github.com/romkatv/powerlevel10k) with full Git status, execution time, and directory context.
- **🔌 Plugins**:
  - `git` — Git command aliases and completion helpers.
  - `zsh-autosuggestions` — Fish-like autosuggestions based on command history.
  - `zsh-syntax-highlighting` — Real-time command syntax highlighting.
- **⚡ Modern CLI Aliases**:
  - `ll` ➔ `ls -la` (Detailed file listing)
  - `cat` ➔ `bat` (Syntax-highlighted file viewing)
  - `l` ➔ `fzf --preview='bat --color=always {}'` (Interactive fuzzy file search with preview)
- **🛠️ Integrated Toolchains**:
  - [Mise](https://mise.jdx.dev/) runtime version manager (`mise activate zsh`).
  - [PNPM](https://pnpm.io/) package manager.
  - Go, Rust/Cargo, .NET tools, Spicetify.
  - Neovim (`/opt/nvim-linux-x86_64/bin`).
  - Antigravity AI CLI (`agy`).
  - Opencode CLI.

---

## 🚀 Installation & Setup

### Prerequisites
- Zsh (`sudo apt install zsh`)
- Oh My Zsh (`sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`)
- Powerlevel10k theme:
  ```bash
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  ```
- Plugins:
  ```bash
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.ohmyzsh/custom}/plugins/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.ohmyzsh/custom}/plugins/zsh-syntax-highlighting
  ```
- Modern CLI tools: `bat`, `fzf`

### Link Configuration

#### Using GNU Stow (Recommended)
```bash
cd ~/dotfiles
stow zsh -t ~
```

#### Using Direct Symlinks
```bash
# Backup existing files
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak.$(date +%F)
[ -f ~/.p10k.zsh ] && mv ~/.p10k.zsh ~/.p10k.zsh.bak.$(date +%F)
[ -f ~/.zshenv ] && mv ~/.zshenv ~/.zshenv.bak.$(date +%F)

# Create symlinks
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
ln -s ~/dotfiles/zsh/.zshenv ~/.zshenv
```

### Reload Shell
```bash
source ~/.zshrc
```
