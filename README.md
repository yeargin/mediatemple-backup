Media Temple Backup Scripts
---------------------------

A few sites that I work with are on MediaTemple, and I want to make sure that I have regular snapshots of the databases and web directories.

1. Clone this repository into your `data` folder

```
cd ~/data/
git clone https://github.com/stephenyeargin/mediatemple-backups.git
```

2. Create a 'backups' or similiarly named folder in the `~/data` folder (e.g. `~/data/backups`)
3. Edit the `config.sh` file to reflect your environment and needs (replace 00000 with the ID of your Gridserver)
4. Run the shell script(s) to verify that they work and that they are creating the correct Zip and GZ files
5. Schedule their execution through another shell script (MediaTemple limits how many you can have) if needed

Troubleshooting
---------------

* The shell scripts themselves are fairly rudimentary. You may need to adjust things based on your personal preferences.
* Note that the array of sites and databases does not have a comma separating the values.
* Make sure you have your paths and usernames/passwords set correctly
