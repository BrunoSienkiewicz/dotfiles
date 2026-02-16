# VS Code Keybindings Cheatsheet

This document describes all the custom keybindings that match Neovim's workflow.

## Leader Key

The leader key is **Space**. All keybindings starting with "Space" require you to:
1. Press and release Space
2. Then press the next key(s) in sequence

## Quick Reference

### Find (f) - Fuzzy Finding

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Space f f` | Quick Open | Find files in workspace |
| `Space f g` | Find in Files | Search text across files (grep) |
| `Space f b` | Show All Editors | List open buffers/files |
| `Space f h` | Show Commands | Command palette |
| `Space f r` | Find References | Find all references to symbol |
| `Space f s` | Go to Symbol | Find symbols in current document |
| `Ctrl+P` | Quick Open | Alternative file finder |

### LSP (l) - Language Server Protocol

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Space l d` | Show Hover | Display diagnostics/documentation |
| `Space l a` | Quick Fix | Show code actions |
| `Space l r` | Rename Symbol | Rename across workspace |
| `Space l f` | Format Document | Format current file |
| `g d` | Go to Definition | Jump to definition |
| `g D` | Go to Declaration | Jump to declaration |
| `g i` | Go to Implementation | Jump to implementation |
| `Shift+K` | Show Hover | Display hover information |
| `[ d` | Previous Diagnostic | Jump to previous error/warning |
| `] d` | Next Diagnostic | Jump to next error/warning |

### Git (g) - Source Control

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Space g s` | SCM View | Open source control panel |
| `Space g c` | Git Commit | Commit staged changes |
| `Space g p` | Git Push | Push commits to remote |
| `Space g l` | Git Pull | Pull changes from remote |

### Windows & Splits

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Space v` | Split Right | Split editor vertically |
| `Space h` | Split Down | Split editor horizontally |
| `Space s c` | Close Editor | Close active editor |
| `Ctrl+H` | Focus Left | Navigate to left editor group |
| `Ctrl+J` | Focus Down | Navigate to lower editor group |
| `Ctrl+K` | Focus Up | Navigate to upper editor group |
| `Ctrl+L` | Focus Right | Navigate to right editor group |

### Buffers (b) - Editor Management

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Space b d` | Close Editor | Close current editor |
| `Space b n` | Next Editor | Switch to next open editor |
| `Space b p` | Previous Editor | Switch to previous editor |

### File Explorer (e)

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Ctrl+B` | Toggle Sidebar | Show/hide sidebar |
| `Space e` | Focus Explorer | Open and focus file explorer |

### Search & Replace (s)

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Space s` | Find and Replace | Open find/replace dialog |
| `Space s n` | Next Match | Jump to next search result |

### Clipboard

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Space y` | Copy | Copy selection to clipboard |
| `Space Y` | Copy Line | Copy entire line to clipboard |
| `Space p` | Paste | Paste from clipboard |

### Quality of Life

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Shift+J` | Join Lines | Join current line with next |
| `Ctrl+D` | Page Down | Scroll down half page |
| `Ctrl+U` | Page Up | Scroll up half page |
| `Shift+U` | Redo | Redo last undone action |

### Problems & Quickfix (q)

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Space q o` | Open Problems | Show problems panel |
| `Space q c` | Close Panel | Close bottom panel |
| `Space q n` | Next Problem | Jump to next problem |
| `Space q p` | Previous Problem | Jump to previous problem |

### Toggles (T - uppercase)

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Space T w` | Toggle Word Wrap | Enable/disable word wrapping |
| `Space T r` | Toggle Whitespace | Show/hide whitespace characters |

### Testing (t)

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Space t t` | Run Test at Cursor | Execute test under cursor |
| `Space t f` | Run Tests in File | Run all tests in current file |
| `Space t a` | Run All Tests | Execute entire test suite |
| `Space t l` | Re-run Last Test | Repeat previous test run |

### Testing (t)

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Space t t` | Run Test at Cursor | Execute test under cursor |
| `Space t f` | Run Tests in File | Run all tests in current file |
| `Space t a` | Run All Tests | Execute entire test suite |
| `Space t l` | Re-run Last Test | Repeat previous test run |

### Jupyter Notebooks (j)

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Space j r` | Run All Cells | Execute all notebook cells |
| `Space j c` | Run Current Cell | Execute cell at cursor |
| `Space j n` | Insert Cell Below | Add new cell below current |
| `Space j d` | Delete Cell | Remove current cell |
| `Space j k` | Previous Cell | Focus cell above |
| `Space j j` | Next Cell | Focus cell below |

### Markdown (m)

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Space m p` | Preview | Show markdown preview |
| `Space m s` | Preview Side-by-Side | Show preview in split |
| `Space m b` | Toggle Bold | Make text bold |
| `Space m i` | Toggle Italic | Make text italic |
| `Space m c` | Toggle Code Block | Insert/remove code block |

### Debugging (d)

| Keybinding | Action | Description |
|------------|--------|-------------|
| `Space d b` | Toggle Breakpoint | Add/remove breakpoint |
| `Space d c` | Continue | Continue debugging |
| `Space d s o` | Step Over | Step over function call |
| `Space d s i` | Step Into | Step into function |
| `Space d s u` | Step Out | Step out of function |
| `Space d t` | Start Debugging | Begin debug session |
| `Space d q` | Stop Debugging | End debug session |

## Tips for Using These Keybindings

1. **Chord Keys**: For two-letter combinations like `Space f f`, press Space, release it, then press `f` twice in succession.

2. **Case Sensitivity**: Uppercase letters require Shift. For example, `g D` means press `g`, then `Shift+D`.

3. **Vim Motions**: While these keybindings don't enable full Vim mode, they provide the most common Neovim workflows. Consider installing a Vim extension if you want modal editing.

4. **Conflicts**: If keybindings conflict with other extensions, they can be customized in `keybindings.json`.

5. **Discovery**: Use `Ctrl+K Ctrl+S` (default VS Code binding) to open the Keyboard Shortcuts editor and search for any command.

## Language-Specific Features

### Python
- Format on save with Black
- Auto-import organization with isort
- Type checking available

### Go
- Format on save with gofumpt
- Auto-import organization
- Integrated test runner

### Java
- Maven/Gradle project support
- JUnit/TestNG test runners
- Advanced debugging

### C++
- IntelliSense via clangd
- CMake integration
- Format with clang-format

### TypeScript/JavaScript
- Auto-imports
- ESLint integration
- Format with Prettier

### Markdown
- Live preview
- Mermaid diagrams
- Math support (KaTeX)

### Jupyter
- Interactive notebooks
- Variable explorer
- Plot rendering

## Customization

To modify keybindings:

1. Open `~/.config/Code/User/keybindings.json` (Linux) or `~/Library/Application Support/Code/User/keybindings.json` (macOS)
2. Add your custom bindings
3. Disable conflicting bindings by setting `"command": "-<original_command>"`

Example:
```json
[
  {
    "key": "space f f",
    "command": "workbench.action.quickOpen"
  },
  {
    "key": "ctrl+p",
    "command": "-workbench.action.quickOpen"
  }
]
```
