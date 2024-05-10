# macOS (Apple silicon) dotfiles


## Install

1. Clone the repo.
    ```shell
    git clone --bare https://github.com/adamgian/dotfiles.git "$HOME/.dotfiles"
    ```
   
2. Checkout branch.
    ```shell
    git --git-dir="$HOME/.dotfiles"/ --work-tree=$HOME checkout macos
    ```

3. Install and configure software, utilities and other nice tid-bits.
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
