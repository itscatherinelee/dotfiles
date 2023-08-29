# dotfiles

## Initial Set Up
1. `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
2. `echo ".cfg" >> .gitignore`
3. `git clone --bare https://github.com/itscatherinelee/dotfiles.git $HOME/.cfg`
4. Run "sendit.sh" script
5. `alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
6. `config checkout`

you might get this:
`error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting`

therefore do this
`mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}`

[link to docs](https://www.atlassian.com/git/tutorials/dotfiles)

## Tech
- Iterm2
- Oh-my-zsh
- Powerlevel10k
- Vim
- Tmux
