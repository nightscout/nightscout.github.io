# Troubleshooting Nightscout

</br>

## Before troubleshooting

1. **Check your email (maybe you missed an important announcement)**

2. **Check your internet provider / SIM credit (can all devices browse internet?)**

3. **Try another browser/computer (if building your Nightscout site)**

   </br>

## Overall third party services

Check the services you're using are available

| Vendor                                                     | Check here:                                                  |
| ---------------------------------------------------------- | ------------------------------------------------------------ |
| **Dexcom**<br/>Dexcom US account<br/>Dexcom non-US account | [https://status.dexcom.com/](https://status.dexcom.com/)  <br/>[https://clarity.dexcom.com/](https://clarity.dexcom.com/)   <br/>[https://clarity.dexcom.eu/](https://clarity.dexcom.eu/) |
| Carelink US account<br/>Carelink non-US account            | [https://carelink.minimed.com/](https://carelink.minimed.com/)  <br/>[https://carelink.minimed.eu/app/login](https://carelink.minimed.eu/app/login) |
| GitHub                                                     | [https://www.githubstatus.com/](https://www.githubstatus.com/) |
| Heroku                                                     | [https://status.heroku.com/](https://status.heroku.com/)     |
| Railway                                                    | [https://railway.instatus.com/](https://railway.instatus.com/) |
| MongoDB Atlas                                              | [https://status.cloud.mongodb.com/](https://status.cloud.mongodb.com/) |
| Northflank                                                 | [https://status.northflank.com/](https://status.northflank.com/) |
| Azure                                                      | [https://azure.status.microsoft/](https://azure.status.microsoft/) |
| NS10BE                                                     | [https://ns.10be.de/en/status.html](https://ns.10be.de/en/status.html) |

</br>

------

## Application crashed

Not knowing if it's a permanent issue, first try to restart it...

```{tab-set}

:::{tab-item} Heroku
[Restart all dynos](/troubleshoot/heroku.md#restart-all-dynos)
:::

:::{tab-item} Railway
[Restart your web app](/troubleshoot/railway.md#restart-your-app)
:::

:::{tab-item} Azure
[Restart app](/troubleshoot/azure.md#restart-app)
:::

:::{tab-item} Northflank
[Restart](/troubleshoot/northflank.md#restart)
:::

:::{tab-item} Fly.io
[Restart your app](/troubleshoot/fly.io.md#restart-your-app)
:::

:::{tab-item} Render
[Restart service](/troubleshoot/render.md#restart-service)
:::

```

-----------

## GitHub

Follow [these](/troubleshoot/github) instructions.

## Heroku

Search your issue [there](/troubleshoot/heroku).

[There's nothing here, yet](heroku-nothing-here) can be due to billing issues.

An [Application error](/troubleshoot/heroku.md#application-error) means Heroku crashed. Restart it and check database size.

## Atlas

Issues during database creation look [there](/troubleshoot/atlas).

The usual reason for failure at build time is a [bad connection string](/troubleshoot/atlas.md#bad-connection-string) (Atlas).

If you encounter a [Boot Error - Unable to connect to Mongo](/troubleshoot/atlas.md#unable-to-connect-to-mongo) it might be due to a [Database Full](/troubleshoot/atlas.md#database-full)

## Railway

Mind you [can't deploy Railway](/vendors/railway/new_user.md#step-1-fork-cgm-remote-monitor) if you just created a new GitHub account.

[Nothing there](/troubleshoot/railway.md#nothing-here) is usually because you forgot to subscribe to a Developer plan.

Else go [there](/troubleshoot/railway).

## Fly.io

Fly.io troubleshooting is complex if you didn't save your `fly.toml` configuration. Check in your local clone of the `cgm-remote-monitor` project. If you can't find it, [recover it](recover-fly-toml) first.

Try to redeploy your app.

Once done, issues are most probably due to your `fly.toml` contents or variables.

</br>

------

## Other issues

### Reports

[Reports slow loading or timeout](/troubleshoot/atlas.md#reports-slow-loading-or-timeout)

### No data in Nightscout

Check your [uploader](/uploader/setup) is configured correctly.

Make sure your Nightscout [time zone](/nightscout/profile_editor/) is correct.

If you use a [DIY closed loop](/nightscout/close_loop) system make sure it's setup correctly.

### Dexcom data not showing

See [this dedicated page](/troubleshoot/dexcom_bridge/).

### Dexcom or CareLink data stopping after a while

```{hint}
CareLink with mmconnect data source stopped functioning for 7xx pumps.
**Remove the `mmconnect` plugin from `ENABLE`. 
```

</br>

First verify you can see your BG in Clarity.

If you're using Heroku, check the web app is not [sleeping](/troubleshoot/heroku.md#sleeping-app).  
You might need to setup an Uptime robot for Heroku Eco plan and Render.

```{admonition} UpTime Robot
Using an uptime robot with a bad password, or other issues originating from Nightscout can lead to a locked account ([Dexcom](/troubleshoot/dexcom_bridge.md#account-lock)).
```

</br>

### Data timing issues

#### Basal is shifted in time

- Check the time zone is correct for your currently active profile in your Nightscout [`Profile editor`](/nightscout/profile_editor/).

<img src="/troubleshoot/img/TShoot30.png" width="800px" >

</br>

#### Data in the future

- Check you don't have data in the future with the `Admin tools`. Remove them if existing.

<img src="/troubleshoot/img/TShoot31.png" width="800px" >

</br>

- If this isn't working, or shows no future data, check in your database (Atlas see [here](/troubleshoot/atlas.md#data-in-the-future))

</br>

#### Basal / IOB / COB missing after DST

- Setup again your time zone in [profile editor](/nightscout/profile_editor/) (authenticate and save).

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