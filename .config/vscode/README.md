# VS Code Configuration

This directory contains VS Code settings that match the Neovim configuration in this dotfiles repository.

## Setup

VS Code settings can be configured either globally or per-user. This configuration is designed to provide a consistent experience across all editors.

### Option 1: User Settings (Recommended)

Copy the settings and keybindings to your VS Code user settings directory:

**Linux:**
```bash
cp ~/.dotfiles/.config/vscode/settings.json ~/.config/Code/User/settings.json
cp ~/.dotfiles/.config/vscode/keybindings.json ~/.config/Code/User/keybindings.json
```

**macOS:**
```bash
cp ~/.dotfiles/.config/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
cp ~/.dotfiles/.config/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
```

### Option 2: Symlink (Alternative)

Create symlinks to keep settings in sync:

**Linux:**
```bash
ln -sf ~/.dotfiles/.config/vscode/settings.json ~/.config/Code/User/settings.json
ln -sf ~/.dotfiles/.config/vscode/keybindings.json ~/.config/Code/User/keybindings.json
```

**macOS:**
```bash
ln -sf ~/.dotfiles/.config/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf ~/.dotfiles/.config/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
```

## Required Extensions

To get the full experience matching Neovim, install these extensions:

### Theme
- **Catppuccin for VSCode** (`Catppuccin.catppuccin-vsc`) - Matches the Neovim theme

### Essential
- **Python** (`ms-python.python`) - Python language support
- **Black Formatter** (`ms-python.black-formatter`) - Python formatting
- **isort** (`ms-python.isort`) - Python import sorting
- **Go** (`golang.go`) - Go language support
- **Prettier** (`esbenp.prettier-vscode`) - JavaScript/TypeScript formatting
- **YAML** (`redhat.vscode-yaml`) - YAML support

### Jupyter Notebooks
- **Jupyter** (`ms-toolsai.jupyter`) - Jupyter notebook support
- **Jupyter Keymap** (`ms-toolsai.jupyter-keymap`) - Jupyter keybindings
- **Jupyter Renderers** (`ms-toolsai.jupyter-renderers`) - Enhanced renderers

### Markdown
- **Markdown All in One** (`yzhang.markdown-all-in-one`) - Markdown editing features
- **markdownlint** (`DavidAnson.vscode-markdownlint`) - Markdown linting
- **Markdown Mermaid** (`bierner.markdown-mermaid`) - Mermaid diagram support

### C++
- **clangd** (`llvm-vs-code-extensions.vscode-clangd`) - C++ language server
- **C++ Extension Pack** (`ms-vscode.cpptools-extension-pack`) - C++ tools
- **CMake Tools** (`ms-vscode.cmake-tools`) - CMake integration

### Java
- **Language Support for Java** (`redhat.java`) - Java language server
- **Debugger for Java** (`vscjava.vscode-java-debug`) - Java debugging
- **Test Runner for Java** (`vscjava.vscode-java-test`) - JUnit/TestNG support
- **Maven for Java** (`vscjava.vscode-maven`) - Maven integration
- **Gradle for Java** (`vscjava.vscode-gradle`) - Gradle integration

### TypeScript Enhanced
- **ESLint** (`dbaeumer.vscode-eslint`) - JavaScript/TypeScript linting
- **TypeScript Next** (`ms-vscode.vscode-typescript-next`) - Latest TypeScript

### Optional but Recommended
- **GitLens** (`eamodio.gitlens`) - Enhanced Git integration
- **Better Comments** (`aaron-bond.better-comments`) - Improved comment highlighting
- **Error Lens** (`usernamehw.errorlens`) - Inline error/warning display
- **Path Intellisense** (`christian-kohler.path-intellisense`) - Autocomplete file paths
- **Code Runner** (`formulahendry.code-runner`) - Run code snippets
- **Code Spell Checker** (`streetsidesoftware.code-spell-checker`) - Spelling checker

## Install Extensions via Command Line

```bash
# Theme
code --install-extension Catppuccin.catppuccin-vsc

# Python
code --install-extension ms-python.python
code --install-extension ms-python.black-formatter
code --install-extension ms-python.isort

# Go
code --install-extension golang.go

# JavaScript/TypeScript
code --install-extension esbenp.prettier-vscode
code --install-extension dbaeumer.vscode-eslint
code --install-extension ms-vscode.vscode-typescript-next

# YAML
code --install-extension redhat.vscode-yaml

# Jupyter
code --install-extension ms-toolsai.jupyter
code --install-extension ms-toolsai.jupyter-keymap
code --install-extension ms-toolsai.jupyter-renderers

# Markdown
code --install-extension yzhang.markdown-all-in-one
code --install-extension DavidAnson.vscode-markdownlint
code --install-extension bierner.markdown-mermaid

# C++
code --install-extension llvm-vs-code-extensions.vscode-clangd
code --install-extension ms-vscode.cpptools-extension-pack
code --install-extension ms-vscode.cmake-tools

# Java
code --install-extension redhat.java
code --install-extension vscjava.vscode-java-debug
code --install-extension vscjava.vscode-java-test
code --install-extension vscjava.vscode-maven
code --install-extension vscjava.vscode-gradle

# Optional
code --install-extension eamodio.gitlens
code --install-extension aaron-bond.better-comments
code --install-extension usernamehw.errorlens
code --install-extension christian-kohler.path-intellisense
code --install-extension formulahendry.code-runner
code --install-extension streetsidesoftware.code-spell-checker
```

## Features

This configuration provides:

- **Catppuccin Mocha theme** (standard palette from VS Code extension)
- **Relative line numbers** (like Neovim with `relativenumber`)
- **Block cursor** (like Neovim)
- **Format on save** for Python, Go, JavaScript/TypeScript, C++, Java, Markdown
- **Nerd Font support** for icons
- **Consistent tab settings** with Neovim (4 spaces, EditorConfig-aware)
- **Git integration** matching Neovim's fugitive workflow
- **Neovim-style keybindings** (Leader key: Space)

## Keybindings

This configuration includes comprehensive keybindings that match Neovim's workflow. Leader key is **Space**.

### Find (f) - Fuzzy Finding
- `Space f f` - Find files (Quick Open)
- `Space f g` - Find by grep (Search in files)
- `Space f b` - Find buffers (Show all editors)
- `Space f h` - Find help (Show commands)
- `Space f r` - Find references
- `Space f s` - Find symbols in document
- `Ctrl+P` - Git files (Quick Open)

### LSP (l) - Language Server Actions
- `Space l d` - Show diagnostics/hover
- `Space l a` - Code actions (Quick Fix)
- `Space l r` - Rename symbol
- `Space l f` - Format document
- `g d` - Go to definition
- `g D` - Go to declaration
- `g i` - Go to implementation
- `Shift+K` - Show hover documentation
- `[ d` - Previous diagnostic
- `] d` - Next diagnostic

### Git (g) - Source Control
- `Space g s` - Git status (Open SCM view)
- `Space g c` - Git commit
- `Space g p` - Git push
- `Space g l` - Git pull

### Windows/Splits
- `Space v` - Split editor right
- `Space h` - Split editor down
- `Space s c` - Close active editor
- `Ctrl+H/J/K/L` - Navigate between editor groups

### Buffers (b) - Editor Management
- `Space b d` - Close active editor
- `Space b n` - Next editor
- `Space b p` - Previous editor

### File Explorer (e)
- `Ctrl+B` - Toggle sidebar visibility
- `Space e` - Focus file explorer

### Search/Replace
- `Space s` - Find and replace
- `Space n h` - Next match (when find is focused)

### Clipboard
- `Space y` - Copy to clipboard
- `Space Y` - Copy line to clipboard
- `Space p` - Paste from clipboard

### Quality of Life
- `Shift+J` - Join lines
- `Ctrl+D` - Page down
- `Ctrl+U` - Page up
- `Shift+U` - Redo

### Problems/Quickfix (q)
- `Space q o` - Open problems panel
- `Space q c` - Close panel
- `Space q n` - Next problem
- `Space q p` - Previous problem

### Toggles (t)
- `Space t w` - Toggle word wrap
- `Space t r` - Toggle render whitespace
- `Space t t` - Run test at cursor
- `Space t f` - Run tests in current file
- `Space t a` - Run all tests
- `Space t l` - Re-run last test

### Jupyter (j)
- `Space j r` - Run all cells
- `Space j c` - Run current cell
- `Space j n` - Insert cell below
- `Space j d` - Delete cell
- `Space j k` - Focus previous cell
- `Space j j` - Focus next cell

### Markdown (m)
- `Space m p` - Show preview
- `Space m s` - Show preview to side
- `Space m b` - Toggle bold
- `Space m i` - Toggle italic
- `Space m c` - Toggle code block

### Debug (d)
- `Space d b` - Toggle breakpoint
- `Space d c` - Continue debugging
- `Space d s o` - Step over
- `Space d s i` - Step into
- `Space d s u` - Step out
- `Space d t` - Start debugging
- `Space d q` - Stop debugging

## Language-Specific Features

### Jupyter Notebooks
- Interactive cell execution
- Kernel management
- Variable explorer
- Plot rendering
- Export to Python/HTML/PDF

### Markdown
- Live preview
- Table of contents generation
- Math support (KaTeX)
- Mermaid diagram rendering
- Auto-completion for links

### C++
- IntelliSense via clangd
- Compile error highlighting
- CMake integration
- Header/source switching
- Code formatting with clang-format

### Java
- Maven/Gradle project support
- JUnit/TestNG test runners
- Advanced debugging
- Refactoring tools
- Auto-import management

### TypeScript
- Auto-imports
- Refactoring
- ESLint integration
- Path IntelliSense
- Jest test runner support

## Customization

Edit `settings.json` to customize:
- Font family and size
- Color theme accent
- Language-specific formatters
- Keybindings (add `keybindings.json`)

## Color Scheme

The VS Code configuration uses the same Catppuccin Mocha theme as Neovim and Tmux, providing a consistent visual experience. Note that VS Code uses the standard Catppuccin Mocha palette from the extension, while Neovim has custom bright color overrides configured in its Lua files.
