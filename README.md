Helium ETL maintenance scripts
==============================

WIP. Some scripts I use to help keep https://etl.dewi.org running, which runs an
instance of Helium's blockchain-etl + Metabase

* Misc maintenance tasks
* Auto-update dev builds
* Monitoring
* Alerting
* Etc

See also: 

* https://github.com/jamiew/helium-etl-queries
* https://github.com/helium/blockchain-etl

Setup
-----

Copy `etl-env.sample.sh` and put in your postgresql credentials. This poor-man's .env
script is loaded by other scripts when needed

```
cp etl-env.sample.sh etl-env.sh
vi etl-env.sh 
# put in your details
```

You can copy the `crontab` file from this repo into place using:

```
crontab crontab-sample
```

