# Setup Uploaders

</br>

```{hint}
You usually should express the Nightscout URL in secure `**https://**`, not only `http://`.
(Unless you set `INSECURE_USE_HTTP` to `true`)
```

## What is my Nightscout URL?

This is the address you type in any browser to display your Nightscout web site.

````{tab-set}

:::{tab-item} Heroku
Your `Nightscout URL` defined in Heroku by your App name, is the one that shows when you open your Nightscout site in a browser.
It usually looks like: `https://yoursitename.herokuapp.com`

<img src="/vendors/heroku/img/SetupNS44.png" width="800px" />
:::

:::{tab-item} Railway
Your `Nightscout URL` is defined in Railway by your Web app name, as shown in your [Dashboard](https://railway.app/dashboard).
It usually looks like: `https://yoursitename.up.railway.app`

<img src="/vendors/railway/img/RailwayM14.png" width="400px" />
:::

:::{tab-item} Northflank
Your `Nightscout URL` is defined in Northflank by your Web app name, as shown in your project services.
It usually looks like: `https://port-name--service-name--project-name--entity-dns-id.code.run`

<img src="/vendors/northflank/img/Northflank29.png" width="600px"/>
:::

:::{tab-item} Azure
Your `Nightscout URL` is defined in Azure by your Web app name, as shown in your App services.
It usually looks like: `https://yoursitename.azurewebsites.net`

<img src="/vendors/azure/img/AzureName.png" width="800px"/>
:::

:::{tab-item} Fly.io
Your `Nightscout URL` is defined in Fly.io by the `app` variable in your `fly.toml` file.
You can also find it in your Dashboard.
It usually looks like: `https://yoursitename.fly.dev`

<img src="/vendors/fly.io/img/FlyIO05.png" width="400px"/>
:::

:::{tab-item} Google Cloud
Your `Nightscout URL` is defined in FreeDNS.
You can find it in [Status - Hostname](https://navid200.github.io/xDrip/docs/Nightscout/Hostname.html).
:::

````

</br>

## Dexcom

You need at least one follower to use Dexcom Share.

```{hint}
If you use a DIY closed loop system it is recommended that you let it upload to Nightscout instead of importing data using Dexcom Share and the `bridge` plugin.
```

On your master phone, touch the Share icon, enable Sharing. If you have no follower, add one. You can also invite yourself.

<img src="/uploader/img/UploadCFG09.png" width="500px" />

</br>

Verify, update or add these variables:

`BRIDGE_USER_NAME 
BRIDGE_PASSWORD 
BRIDGE_SERVER`

You need to add `bridge` in the `ENABLE` variable. Do not delete other entries, just add `bridge` after a space.

</br>

```{admonition} MOST COMMON ERRORS
:class: hint
The most common error on initial Nightscout setups is that people incorrectly use an old account or an old password. To test your username and password, go to Dexcom's Clarity page (check [here for USA accounts](https://clarity.dexcom.com) and [here for the others](https://clarity.dexcom.eu)) and try logging in to your Dexcom account. If your account info isn't valid, or you don't see any data in your Clarity account... you need to figure out your actual credentials before moving ahead. See [here](/troubleshoot/dexcom_bridge/) for troubleshooting tips and information on your Dexcom account.
```

```{admonition} Password
:class: note
*Some people have had problems with their bridge connecting when their Dexcom passwords are entirely numeric. If you have connection issues in that case, try changing your password to something with a mix of numbers and letters.*
```

</br>

## Medtronic CareLink

```{warning}
The `mmconnect` plugin is **NOT** functional anymore with recent pumps (7xx) in cloud Nightscout sites.
```

You can use an Android phone with a private version of xDrip+. See [**here**](../../uploader/xdripcarelink) how to set it up.

</br>

## [Medtronic 600 Series with uploader](http://pazaan.github.io/600SeriesAndroidUploader/)

<img src="/uploader/img/UploadCFG08.png" width="600px" />

You can also use [this QR code generator](https://nightscout.github.io/pages/configure/) and the menu item `Scan NS-Autoconfig QR Code` to copy the information.

For hosted Nightscout you'll find the QR code generator in [Uploaders](https://www.t1pal.com/account/sites/my#Uploaders), select the `HTTP` tab.

You might want to setup [additional fields](https://github.com/nightscout/cgm-remote-monitor/#pump-pump-monitoring) for your pump.

Facebook Group [Nightscout for Medtronic](https://www.facebook.com/groups/NightscoutForMedtronic)

</br>

## [xDrip+](https://jamorham.github.io/#xdrip-plus)

```{admonition} Mind the syntax!
:class: warning
<span style="font-size:larger;">**`https://API_SECRET@my_nightscout_url/api/v1/`**</span>  
`my_nightscout_url` will depend on where your site is hosted (see top of this page)  
You will find your `API_SECRET`in your site variables.
```

Here is how it will look like for some vendors:

```html
https://API_SECRET@yoursite.herokuapp.com/api/v1/
https://API_SECRET@yoursite.up.railway.app/api/v1/
https://API_SECRET@yoursite.guest.t1pal.com/api/v1/
https://API_SECRET@yoursite.10be.de/api/v1/
```

</br>

<img src="/uploader/img/UploadCFG00.png" width="900px" />

Facebook Group [xDrip](https://www.facebook.com/groups/xDripG5)

</br>

## [Glimp](https://play.google.com/store/apps/details?id=it.ct.glicemia)

<img src="/uploader/img/UploadCFG02.png" width="800px" />

</br>

## [Juggluco](http://jkaltes.byethost16.com/Juggluco/mgdL/index.html)

<img src="/uploader/img/UploadCFG11.png" width="800px" />

</br>

## [Diabox](https://www.bubblan.org/diabox/)

<img src="/uploader/img/UploadCFG03.png" width="800px" />

</br>

## [LinkBluCon](https://www.ambrosiasys.com/our-products/linkblucon/)

<img src="/uploader/img/UploadCFG04.png" width="800px" />

</br>

## [Tomato](http://tomato.cool/)

<img src="/uploader/img/UploadCFG05.png" width="600px" />

</br>

## [Spike](https://spike-app.com/)

Look [here](https://github.com/SpikeApp/Spike/wiki/Spike-Follower-Mode#configure-spike-master).

<img src="/uploader/img/UploadCFG10.png" width="300px" />

Facebook group [Spike App](https://www.facebook.com/groups/spikeapp)

</br>

## [xDrip4iOS](https://xdrip4ios.readthedocs.io/en/latest/)

<img src="/uploader/img/UploadCFG06.png" width="300px" />

Facebook group [xDrip4iOS](https://www.facebook.com/groups/853994615056838/)