# Debian (x64) dotfiles


## Install

1. Clone the repo.
    ```shell
    git clone --bare https://github.com/adamgian/dotfiles.git "$HOME/.dotfiles"
    ```
   
2. Set up alias.
    ```shell
    alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    ```
    
3. Checkout branch.
    ```shell
    dotfiles checkout debian
    ```

4. Install and configure software, utilities and other nice tid-bits.
    ```shell
    #TODO:
    bash setup.sh
    ```
<br>


## Contributing

The force flag is needed in order to add or update files.

```shell
dotfiles add -f <file>
```
