vim-aos
=======

Pathogen-style plugin for Alcatel AOS for Vim.

Syntax aims to fulfil the [OmniSwitch 6250/6450 CLI Reference](http://www.alcaserv.cz/images/Data/Doumentace_pdf/Campus_Acess_Switches/OmniSwitch_6450/02_User_Guide/04_OmniSwitch_6250_6450_CLI_Reference_Guide/os_cli_664_revD1.pdf) (PDF Warning).

Installation
------------

First, install [tpope/vim-pathogen](https://github.com/tpope/vim-pathogen).

Then, install this plugin into `~/.vim/bundle`:
```Shell
$ cd ~/.vim/bundle
$ git clone https://github.com/breed808/vim-aos
```


![Before](https://raw.githubusercontent.com/breed808/vim-aos/master/before.png)
![After](https://raw.githubusercontent.com/breed808/vim-aos/master/after.png)

Detection
---------

There are two filetype detection methods:
1. \<filename\>.aos
2. First line beginning with `!`, followed by multiple `=` characters with a second `!` and the end of the line. Second line beginning with `! File:`

E.G. the following would be detected using the second detection method:

```
!========================================!
! File: /flash/2018-07-05-EDGE01.conf    !
!========================================!
```

You can also manually declare the filetype from within vim by `:set ft=aos`

Contributing
------------

Note that this syntax file is not exhaustive, the author has completed the more common behaviour. Pull requests to add missing behaviour are more than welcome.

The author also admits his inexperience writing syntax files, and as such, experienced vimscript writers may find the structure of the file to be naive or inefficient. Pull requests to amend this are also welcome.

Notes
-----

Currently, the syntax is structured as follows:

```
CATEGORY [FUNCTION] operators values
```

An example of this is the `ip interface` syntax:

```
ip interface "Voice" address 192.168.1.1 mask 255.255.255.0 vlan 100 ifindex 1
```

In this example, `ip` is the category, `interface` is the category function, and `address`/`mask`/`vlan`/`ifindex` are operators. The IP address, subnet mask, vlan ID and ifindex ID are all values.

While some AOS command categories have a number of functions (`ip` and `lacp` are good examples), other command categories are simpler, containing only operators.

For example, in:

```
ip domain-lookup
```

`domain-lookup` is considered an operator, as it enables the DNS resolver and has no additional input.
