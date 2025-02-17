# Setup Oh My Zsh + Pure + Fonts on Windows

## Step 1: Install Zsh

1. Download the latest [MSYS2 Zsh package](https://packages.msys2.org/packages/zsh?repo=msys&variant=x86_64).
2. Extract the package files into your Git folder (e.g., `C:\Program Files\Git`) and merge the contents.
3. Open Git Bash and run:

```bash
zsh
```

4. Follow the setup wizard to configure tab completion and history. If it doesn't appear, rerun it manually.
5. Set Zsh as the default shell by adding this to `~/.bashrc`:

```bash
if [ -t 1 ]; then
  exec zsh
fi
```

## Step 2: Install Oh My Zsh

Run this command in your Zsh terminal:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Step 3: Install Plugins & Configure Oh My Zsh

We'll install two plugins:
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

Run these commands:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
```

To enable the plugins, add this to `~/.zshrc`:

```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

If you experience display issues with `zsh-autosuggestions`, downgrade to version `v0.6.4`:

```bash
cd ~/.oh-my-zsh/plugins/zsh-autosuggestions
git checkout tags/v0.6.4 -b v0.6.4-branch
```

### Fix Encoding Issues

If you see strange characters in your terminal, add this to `~/.bashrc` before setting Zsh as the default shell:

```bash
/c/Windows/System32/chcp.com 65001 > /dev/null 2>&1
```

## Step 4: Install Pure Theme & Fonts

By default, Oh My Zsh uses the `robbyrussell` theme. To use Pure, install it manually:

1. Clone the Pure theme:

```bash
git clone https://github.com/sindresorhus/pure.git ~/.zsh/pure
```

2. Create symlinks for Pure:

```bash
cd ~/.zsh/pure
ln -s "$PWD/pure.zsh" "$HOME/.zfunctions/prompt_pure_setup"
ln -s "$PWD/async.zsh" "$HOME/.zfunctions/async"
```

3. Enable Pure by adding this to `~/.zshrc` **after** `source $ZSH/oh-my-zsh.sh`:

```bash
fpath=("$HOME/.zfunctions" $fpath)
autoload -U promptinit; promptinit
prompt pure
```

### Install Fonts

Clone and install Powerline fonts:

```bash
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
```

## Step 5: Customize Pure Theme & Syntax Highlighting

### Default Pure Theme

![Pure Theme](https://raw.githubusercontent.com/hi-dharmatwada/oh-my-zsh-setup/master/images/pure-theme-default.png)

### Customized Pure Theme

![Customized Pure Theme](https://raw.githubusercontent.com/hi-dharmatwada/oh-my-zsh-setup/master/images/pure-theme.png)

To customize syntax highlighting, add this to `~/.zshrc`:

```bash
# Customize Syntax Highlighting

ZSH_HIGHLIGHT_STYLES[builtin]='fg=#5AF68E'
ZSH_HIGHLIGHT_STYLES[function]='fg=#5AF68E'
ZSH_HIGHLIGHT_STYLES[command]='fg=white'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#5AF68E'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#5AF68E'
ZSH_HIGHLIGHT_STYLES[path]='fg=white'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#6ef79c'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#57C7FF'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#57C7FF'
```

To customize Pure's prompt colors, add this before `prompt pure` in `~/.zshrc`:

```bash
# Customize Pure Prompt Colors

zstyle :prompt:pure:path color "#57C7FF"
zstyle ':prompt:pure:prompt:*' color "#59F28C"
zstyle ':prompt:pure:git:branch' color 242
zstyle ':prompt:pure:git:dirty' color 242
zstyle ':prompt:pure:git:arrow' color "#99EBFC"
```
