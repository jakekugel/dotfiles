# dotfiles
Collection of configuration files for bash and other Linux apps.  Inspiration from https://github.com/blezek/dotfiles.

## Git Setup

Set up username and email.

``` sh
git config --global user.name "Jake Kugel"
git config --global user.email jake_kugel@yahoo.com
git config --global pull.rebase true
git config --global core.autocrlf input
git config --global init.defaultBranch main
```

## SSH Setup

``` sh
cat /dev/zero | ssh-keygen -b 4096 -C "jake_kugel@yahoo.com $(hostname)" -q -N ""
```

Copy `~/.ssh/id_rsa.pub` up to [github](https://github.com/settings/keys), etc....

## Dotfiles Setup
``` sh
git clone git@github.com:jakekugel/dotfiles.git .dotfiles
(cd .dotfiles && make)
```

