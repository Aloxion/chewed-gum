# chewed-gum

# Install Using CURL

To use this tool, you need two things.

* A path, where it is going to be exported to.
* Gum | Charmbracelet


## Gum

## Tool - Chewed gum

To download the release, you can use this one-liner.
If you want to declare a specific path, you can adjust the "$HOME/chewed-gum"
### Download latest tag
```sh
LATEST_TAG=$(curl -s https://api.github.com/repos/Aloxion/chewed-gum/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/') && mkdir -p $HOME/chewed-gum && curl -sL "https://github.com/Aloxion/chewed-gum/archive/refs/tags/${LATEST_TAG}.tar.gz" | tar -xzf - --strip-components=1 -C $HOME/chewed-gum && chmod +x $HOME/chewed-gum && (grep -q 'export PATH=$HOME/chewed-gum:$PATH' ~/.zshrc || echo 'export PATH=$HOME/chewed-gum:$PATH' >> ~/.zshrc) && source ~/.zshrc
```

### Downloade specifc tag
Remember, to replace \<tag-version>, with the actual version you want to use.
```sh
curl -sL "https://github.com/Aloxion/chewed-gum/archive/refs/tags/<tag-version>.tar.gz" | tar -xzf - --strip-components=1 -C $HOME/chewed-gum
```

### Permissions
If any issues occur with permission, remember to allow the chewed-gum file to be ran like so:

```sh
chmod +x $HOME/chewed-gum/main.sh
```