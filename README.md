# Oh My Zsh + Pure - Rethink Your Windows Terminal Experience

**Only solution that works for setting up Pure prompt with Oh My Zsh.**

## Preview
![Preview](https://raw.githubusercontent.com/azharzaman1/oh-my-zsh-with-pure-theme/refs/heads/main/custom.png)

## Prerequisites
- Git
- Git Bash
- Windows Terminal (With Git Bash Profile)

**NOTE:** You can follow any online tutorial for above mentioned requirements. 
 
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
This is the only solution that works for setting up Pure prompt with Oh my Zsh on windows. By default, Oh My Zsh uses the `robbyrussell` theme. 

Change default theme to nothing. 

```bash
ZSH_THEME=""
```

To use Pure, install it manually:

1. Clone the Pure theme:

```bash
git clone https://github.com/sindresorhus/pure.git ~/.zsh/pure
```

2. Clone Pure into `~/.zsh/pure` and make Pure scripts accessible via symlinks (if you get File already exists error, move forward).

```bash
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
cd ~/.zsh/pure
ln -s "$HOME/.zsh/pure/pure.zsh" "$HOME/.zsh/pure/prompt_pure_setup"
ln -s "$HOME/.zsh/pure/async.zsh" "$HOME/.zsh/pure/async"
```

3. Enable Pure by adding this at the end of `~/.zshrc` file.:

```bash
fpath=($HOME/.zsh/pure $fpath)
autoload -U promptinit; promptinit
prompt pure
```
Restart your terminal and Pure should be loaded without any errors.

If you see `prompt_pure_setup:1: command not found: pure.zsh`, it means Zsh found the file `prompt_pure_setup`, but it can't find `pure.zsh` to execute it, even though they are in the same folder. We need to fix broken symlinks; run these commands in terminal.

```bash
cd "$HOME/.zsh/pure"
rm prompt_pure_setup
rm async
cp pure.zsh prompt_pure_setup
cp async.zsh async
```
Because you are on Windows, `ln -s` sometimes creates a "plain text file" that looks like a link to Windows but is unreadable by Zsh. We just replace the links with actual copies. Now when you restart the terminal, Pure should load without any errors.


### Install Fonts

Clone and install Powerline fonts:

```bash
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
```

## Step 5: Customize Pure Theme & Syntax Highlighting
Give your terminal the personalized look. This is where your personal preferences come into play. If colors look dull, don't worry this is because of your Windows terminal color scheme.

While on Windows terminal, press `Ctrl + ,` to open settings. In the sidebar under **Profiles** section, select **Defaults** tab. Expand **Appearance** section. You can select different color schemes and see what is best for your self.

My personal preference is `Dark+` and it also goes well with custom syntax colors i have provided below.

### Default Preview

![Default Preview](https://raw.githubusercontent.com/azharzaman1/oh-my-zsh-with-pure-theme/refs/heads/main/default.png)

### Customized Preview

![Customized Preview](https://raw.githubusercontent.com/azharzaman1/oh-my-zsh-with-pure-theme/refs/heads/main/custom.png)

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

# Additionally show git stash chunk in terminal 
zstyle :prompt:pure:git:stash show yes
```
---

## Contributing

I’m open to contributions! Feel free to submit pull requests (PRs) for improvements, fixes, or alternative approaches. If you have suggestions or better methods, I’d love to hear them. Let’s make this guide even better together! 🚀

## Issues & Feedback

If you encounter any issues or have feedback, please open an issue on GitHub. Your input is highly appreciated!


