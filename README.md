My dotfiles
=================

This here is my very basic setup for keeping my dotfiles in git. I have used the
template repository for bootstraping dotfiles with [Dotbot][dotbot].

Installation
================

```sh
git clone https://github.com/idanov/dotfiles.git ~/.dotfiles
```

```sh
cd ~/.dotfiles
./install
```

To upgrade the submodules to their latest versions, one could periodically run:

```sh
cd ~/.dotfiles
git submodule update --init --remote
```

or

```sh
cd ~/.dotfiles
./install
```

Credits
-----------
My dotfiles were inspired by:

* [anishathalye's dotfiles][anishathalye_dotfiles]
* [m45t3r's dotfiles][m45t3r_dotfiles]
* [alexwh's dotfiles][alexwh_dotfiles]

[dotbot]: https://github.com/anishathalye/dotbot
[fork]: https://github.com/anishathalye/dotfiles_template/fork
[anishathalye_dotfiles]: https://github.com/anishathalye/dotfiles
[m45t3r_dotfiles]: https://github.com/m45t3r/dotfiles
[alexwh_dotfiles]: https://github.com/alexwh/dotfiles
