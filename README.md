# HSDocker

## How to use this?
1. Download world files from [here](https://www.mediafire.com/file/5oko5y8h7uj6i9z/world.zip/file) and put them into `servers/game/configuration`
2. Run `./configure.sh` to download server configs
3. Start the server using `sudo docker compose up`
4. Restart the server and enjoy!

## How do I make myself admin?

1. Join and disconnect to create a profile (if you don't have a profile already)
2. Run this command:

```sh
./setrank.sh <your_ign> ADMIN
```
