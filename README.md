# chewed-gum

An executable customized tool, that uses gum. Includes scripts for github, for upholding good practices.

# Install Using CURL

To use this tool, you need gum.

* Gum by [charm.sh](https://charm.sh/)

## Gum

Go to [Gum](https://github.com/charmbracelet/gum?tab=readme-ov-file#choose), for installation instructions.

You can install gum by using homebrew.

```
brew install gum
```

## Tool - Chewed gum

To download the release, you can use this one-liner.
If you want to declare a specific path, you can adjust the "$HOME/chewed-gum"
### Download latest tag
This oneliner, assumes you have .zshrc in your $home folder, if you dont use zsh terminal, then use the one after this.
```sh
LATEST_TAG=$(curl -s https://api.github.com/repos/Aloxion/chewed-gum/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/') && mkdir -p $HOME/chewed-gum && curl -sL "https://github.com/Aloxion/chewed-gum/archive/refs/tags/${LATEST_TAG}.tar.gz" | tar -xzf - --strip-components=1 -C $HOME/chewed-gum && chmod +x $HOME/chewed-gum && (grep -q 'export PATH=$HOME/chewed-gum:$PATH' ~/.zshrc || echo 'export PATH=$HOME/chewed-gum:$PATH' >> ~/.zshrc) && source ~/.zshrc
```

Only installation
```sh
LATEST_TAG=$(curl -s https://api.github.com/repos/Aloxion/chewed-gum/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/') && mkdir -p $HOME/chewed-gum && curl -sL "https://github.com/Aloxion/chewed-gum/archive/refs/tags/${LATEST_TAG}.tar.gz" | tar -xzf - --strip-components=1 -C $HOME/chewed-gum && chmod +x $HOME/chewed-gum
```

You yourself, have to export this to either bashrc, or whatever terminal you use.

### Downloade specifc tag
To download specific tags, you need to create the folder first, and chmod +x it after.
Remember, to replace \<tag-version>, with the actual version you want to use.
```sh
curl -sL "https://github.com/Aloxion/chewed-gum/archive/refs/tags/<tag-version>.tar.gz" | tar -xzf - --strip-components=1 -C $HOME/chewed-gum
```

### Permissions
If any issues occur with permission, remember to allow the chewed-gum file to be ran like so:

```sh
chmod +x $HOME/chewed-gum
```

# About me

These custom scripts was created by me: Aloxion. It is a repo in progress, and trying to make more general, currently only having scripts for git related commands.