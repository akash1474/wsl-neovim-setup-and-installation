## NeoVim WSL Installation and Setup for Windows

>Requirements

* WSL should be installed on windows
* bash must be working in __Command Prompt__

>Opening bash
* Open Command Prompt
* Type --bash--


**Installing the neovim in bash[wsl]**

    $ sudo apt install neovim

**Navigating to neovim directory** 

    $ cd ~/.config/nvim

**Creating a autoload folder in nvim folder**

    $ mkdir autoload
**Editing the init.vim file** 

    $ nvim init.vim
This will open the **neovim** editor in the terminal

*****Alternative**
* Copy and paste the init.vim from repository folder
* Open neovim and then type
  ```
    :PlugInstall
  ```
  This should install all the plugins


## You are good to go!!!

Refer to this video if any issues
[Full Tutorial](https://www.youtube.com/watch?v=ZEFXeRIFvN0&t=1689s)

