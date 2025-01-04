# HSDocker

## How to use this?
1. Download world files from [here](https://www.mediafire.com/file/5oko5y8h7uj6i9z/world.zip/file) and put them into `servers/game/configuration`
2. Run `./configure.sh` to download server configs
3. Start the server using `sudo docker compose up --build`
4. Download regions data from [here](https://github.com/Swofty-Developments/HypixelSkyBlock/raw/refs/heads/master/configuration/Minestom.regions.csv) and upload it into the `regions` collection in mongo database running on `localhost`
5. Restart the server and enjoy!
