# https://dominikrys.com/posts/zsh-in-git-bash-on-windows/#fixing-mangled-output
/c/Windows/System32/chcp.com 65001 > /dev/null 2>&1

# https://dominikrys.com/posts/zsh-in-git-bash-on-windows/#installing-zsh-in-git-bash
if [ -t 1 ]; then
  exec zsh
fi