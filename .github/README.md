# dotfiles


## Install

1. Clone repo.
    ```shell
    git clone --bare https://github.com/adamgian/dotfiles.git "$HOME/.dotfiles"
    ```
   
2. Set up the alias.
    ```shell
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    ```
    
3. Checkout relevant platform branch.
    - Debian (x64):
        ```shell
        dotfiles checkout debian
        ```
        
    - macOS (Apple silicon):
        ```shell
        dotfiles checkout macos
        ```
4. Install and configure software, utilities and other nice tid-bits.
    ```shell
    #TODO:
    bash todo.sh
    ```
<br>


## Contributing

The force flag is needed in order to add new files to be tracked.

```shell
dotfiles add -f <file>
```
