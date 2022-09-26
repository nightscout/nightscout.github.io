# Nightscout Troubleshooting

</br>

## Overall third party services

</br>

<span style="font-size:smaller;">**APPLIES TO:**</span>	DIY Nightscout

For [Nightscout as a service](/#nightscout-as-a-service) contact directly ***support*** at ***t1pal.com*** or use the `Get Support` link.

</br>

### Before troubleshooting

</br>

Check the services you're using.

Dexcom: [https://status.dexcom.com/](https://status.dexcom.com/)

Carelink US: [https://carelink.minimed.com/](https://carelink.minimed.com/)

Carelink non-US: [https://carelink.minimed.eu/app/login](https://carelink.minimed.eu/app/login)

GitHub: [https://www.githubstatus.com/](https://www.githubstatus.com/)

Heroku: [https://status.heroku.com/](https://status.heroku.com/)

Railway: [https://railway.instatus.com/](https://railway.instatus.com/)

Atlas: [https://status.cloud.mongodb.com/](https://status.cloud.mongodb.com/)

</br>

## GitHub

Dedicated page is [here](github.md).

</br>

## Heroku

Dedicated page is [here](heroku.md).

</br>

## Atlas

##### [Boot Error - Unable to connect to Mongo](../atlas/#unable-to-connect-to-mongo)

<img src="../img/TShoot43.png" style="zoom:80%;" >

##### [Database Full](../atlas/#database-full)

##### [Reports slow loading or timeout](../atlas/#reports-slow-loading-or-timeout)

Look at this [dedicated page](./atlas.md).

</br>

## Nightscout page doesn't open

- With Heroku check [here](../heroku).

</br>

## No data in Nightscout

Make sure your Nightscout [time zone](../../nightscout/profile_editor/) is correct.

### Dexcom data not showing

See [this dedicated page](../dexcom_bridge/).

</br>

### Dexcom or CareLink data stopping after a while

!!!Note
    CareLink with mmconnect data source stopped functioning for most.  
    **Remove the `mmconnect` plugin from `ENABLE` if you use Heroku**.  
    This probably applies to other providers too.

</br></br>

First verify you can see your BG in Clarity.

If data is present open Heroku and check you app didn't fall asleep.

<img src="../img/TShoot25.png" style="zoom:80%;" >

</br>

A sleeping app was due to your Heroku free plan: a Hobby plan makes the app never sleep. [https://www.heroku.com/pricing](https://www.heroku.com/pricing) 

Another reason for a sleeping app can be due to a failure to obtain data from Dexcom Share, check the logs to understand the reasons.

</br>

!!!Warning "UpTime Robot"
    Using an uptime robot with a bad password, or other issues originating from Nightscout can lead to a locked account ([Dexcom](../dexcom_bridge/#account-lock)) or Heroku addresses ban. This is **not a recommended solution** as it might generate a global Heroku IP blacklist lock that could propagate to all other users. If you use Nightscout, uploading data in the cloud or even just having a browser or an app downloading data should be enough to keep your app awake.

</br>

### Error code instead of a BG value

Nightscout implements Dexcom error codes as listed below:

| Code  | Corresponding error   |
| ----- | --------------------- |
| `?SN` | Sensor not active     |
| `?MD` | Minimal deviation     |
| `?NA` | No antenna            |
| `?NC` | Sensor not calibrated |
| `?CD` | Counts deviation      |
| `?AD` | Absolute deviation    |
| `???` | Power deviation       |
| `?RF` | Bad RF                |

</br>

## Data timing issues

### Basal is shifted in time

- Check the time zone is correct for your currently active profile in your Nightscout [`Profile editor`](../../nightscout/profile_editor/).

<img src="../img/TShoot30.png" style="zoom:75%;" >

</br>

### Data in the future

- Check you don't have data in the future with the `Admin tools`. Remove them if existing.

<img src="../img/TShoot31.png" style="zoom:75%;" >

</br>

- If this isn't working, or shows no future data, check in your database for Atlas see [here](../atlas/#data-in-the-future)

</br>

### Basal / IOB / COB missing after DST

- Setup again your time zone in [profile editor](../../nightscout/profile_editor/) (authenticate and save).

</br>