# chewed-gum

# Install Using CURL

To use this tool, you need two things.

* A path, where it is going to be exported to.
* Gum | Charmbracelet


## Gum

## Tool - Chewed gum

First make you sure you have a directory, you can extract the tar file to.

e.g:

```bash
mkdir $HOME/chewed-gum
```

This will create a directory chewed-gum from your home directory.


To download the release, you can use this command:
If you want to declare a specific path, you can adjust the "$HOME/chewed-gum"
### Download latest tag
```sh
LATEST_TAG=$(curl -s https://api.github.com/repos/Aloxion/chewed-gum/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/') && mkdir -p $HOME/chewed-gum-$LATEST_TAG && curl -sL "https://github.com/Aloxion/chewed-gum/archive/refs/tags/${LATEST_TAG}.tar.gz" | tar -xzf - --strip-components=1 -C $HOME/chewed-gum-$LATEST_TAG && chmod +x $HOME/chewed-gum-$LATEST_TAG/chewed-gum && (grep -q 'export PATH=$HOME/chewed-gum-$LATEST_TAG:$PATH' ~/.zshrc || echo 'export PATH=$HOME/chewed-gum-$LATEST_TAG:$PATH' >> ~/.zshrc) && source ~/.zshrc
```

### Downloade specifc tag
Remember, to replace \<tag-version>, with the actual version you want to use.
```sh
curl -sL "https://github.com/Aloxion/chewed-gum/archive/refs/tags/<tag-version>.tar.gz" | tar -xzf - --strip-components=1 -C $HOME/chewed-gum-<tag-version>
```

### Permissions
If any issues occur with permission, remember to allow the chewed-gum file to be ran like so:

```sh
chmod +x $HOME/chewed-gum/chewed-gum
```