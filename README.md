# dotfiles

Dotbot makes installing and sharing dotfiles just as simple.

## Installation

```bash
$ git clone https://github.com/nkprince007/dotfiles.git
$ cd dotfiles
$ ./install
```

### Workaround for installation

Since recent times, due to an [issue with dotbot bin script](https://github.com/anishathalye/dotbot/issues/163),
the installation script has been experiencing failures. As a workaround, it is
recommended to use the following option.

```bash
$ git clone --recursive https://github.com/nkprince007/dotfiles.git
$ cd dotfiles
$ pip install dotbot
$ dotbot -c install.conf.yaml --plugins-dir dotbot/plugins
```
