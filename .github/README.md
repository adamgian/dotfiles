# My dotfiles


## Install

1. Clone the repo.
    ```shell
    git clone --bare https://github.com/adamgian/dotfiles.git "$HOME/.dotfiles"
    ```
    
2. Checkout the relevant platform branch.
    - Debian (x64):
        ```shell
        git --git-dir="$HOME/.dotfiles/" --work-tree=$HOME checkout debian
        ```
        
    - macOS (Apple silicon):
        ```shell
        git --git-dir="$HOME/.dotfiles/" --work-tree=$HOME checkout macos
        ```
        
3. Install and configure software, utilities and other nice tid-bits.
    ```shell
    bash "$HOME/setup.sh"
    ```
<br>


## Contributing

The force flag is needed in order to add or update files.

```shell
dotfiles add -f <file>
```
