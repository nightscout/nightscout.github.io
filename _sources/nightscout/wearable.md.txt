# Nightscout on your Watch

</br>

## Pebble Smartwatches

<img src="/nightscout/img/PebbleNSFoundation.jpeg" width="400px" />

Pebble smartwatch use is a historic milestone of CGM in the Cloud. Pebble has been bought by Fitbit in 2016 and necessary resources have moved to archives and [rebble.io](https://rebble.io/). Pebble support is still maintained in Loop, AndroidAPS, FreeAPS and xDrip.

You can't find the Pebble app for iOS in the [Apple Store](https://www.reddit.com/r/pebble/comments/q1e6qx/the_pebble_ios_app_is_now_gone_from_the_app_store/) anymore. For Android you need to download it from [APKMirror](https://www.apkmirror.com/apk/pebble-technology-corp/pebble/pebble-4-4-2-1405-62d45d7d7-endframe-release/pebble-4-4-2-1405-62d45d7d7-endframe-android-apk-download/) or [APKPure](https://apkpure.com/it/pebble/com.getpebble.android.basalt).

For authentication and getting the watchfaces, the original server closed so you'll need to register with [Rebble](https://auth.rebble.io/auth/).

You'll find Nightscout watchfaces [here](https://apps.rebble.io/en_US/search/watchfaces/1). Search for Nightscout, CGM, ... 

Configure the watchface with your Nightscout site URL.

</br>

### [urchin](https://github.com/mddub/urchin-cgm)

A Pebble watchface to view data from a continuous glucose monitor in graph format.

</br>

If you want to use your Pebble with Loop look [here](https://loopkit.github.io/loopdocs/nightscout/pebble/), for AndroidAPS [here](https://androidaps.readthedocs.io/en/latest/EN/Configuration/Watchfaces.html#pebble) and FreeAPS [here](https://github.com/mddub/pancreabble).

</br>

### [xDrip](https://github.com/NightscoutFoundation/xDrip/releases)

Enable Pebble Integration in Smartwatch features.

<img src="/nightscout/img/Watch02.png" width="800px" />

</br>

You can answer no to default watchface install so that you will be able to select another one. You can then decide to install or not the snooze control.

<img src="/nightscout/img/Watch03.png" width="600px" />

</br>

## [Android Wear OS smartwatches](https://wearos.google.com/#hands-free-help)

With an Android smartphone.

````{tab-set}

:::{tab-item} Android Wear 1
- Recommended: Install an old version of Android Wear on your phone (search APKMirror for example: Android Wear 2.9.0.185084575.gms) and pair your watch. Make sure to allow GPS and Wear OS access to position on the watch. Allow Wear OS to run in background on your phone.

***Note:If you installed Wear OS, you will need to manually update the watch Google Play Services see [here](https://androidaps.readthedocs.io/en/latest/EN/Usage/SonySW3.html).***

  - Once your smartwatch Google Play Service has been updated to a version above 9.x you can safely update Android Wear to Wear OS.
  - Change the watchface to match your app (in Wear OS or on your watch).
:::

:::{tab-item} Android Wear 2
- Install [Wear OS](https://play.google.com/store/apps/details?id=com.google.android.wearable.app) on your phone and pair your watch. Make sure to allow GPS and Wear OS access to position on the watch. Allow Wear OS to run in background on your phone.

- [Install](https://support.google.com/wearos/answer/7314014?hl=en) your app wear extension from the smartwatch Google Play store, selecting the apps installed on your phone.*Note: Newer versions of Wear OS do not support this feature anymore, use [Wear Installer](https://youtu.be/8HsfWPTFGQI) or Use [GeminiMan Wear OS Manager](https://play.google.com/store/apps/details?id=com.geminiman.wearosmanager) or [Easy Fire Tools](https://play.google.com/store/apps/details?id=de.agondev.easyfiretools).*

- Change the watchface to match your app (in Wear OS or on your watch).
:::

:::{tab-item} Android Wear 3
- Install [Wear OS](https://play.google.com/store/apps/details?id=com.google.android.wearable.app) on your phone and pair your watch. Make sure to allow GPS and Wear OS access to position on the watch. Allow Wear OS to run in background on your phone.

- Use [Wear Installer](https://youtu.be/8HsfWPTFGQI) or Use [GeminiMan Wear OS Manager](https://play.google.com/store/apps/details?id=com.geminiman.wearosmanager) or [Easy Fire Tools](https://play.google.com/store/apps/details?id=de.agondev.easyfiretools).

- Change the watchface to match your app (in Wear OS or on your watch).
:::

:::{tab-item} Android Wear 5
- Wear OS 5 does not allow code execution in watchfaces.
- Use [GlucoDataHandler](#glucodatahandler).
:::


````

</br>

### [GlucoDataHandler](https://github.com/pachi81/GlucoDataHandler)

This innovative [app](https://play.google.com/store/apps/details?id=de.michelinside.glucodatahandler) receives data from various sources and visualizes it clearly on your Android smartphone, smartwatch (Wear OS, Miband, and Amazfit), and in your car (via [GlucoDataAuto](https://github.com/pachi81/GlucoDataAuto/blob/main/README.md)).

### [xDrip](https://github.com/NightscoutFoundation/xDrip/releases)

Enable Android Wear Integration to send xDrip BG to the smartwatch. Do not enable neither Collection nor Force Collection.

<img src="/nightscout/img/Watch00.png" width="800px" />

Full xDrip wear documentation [here](https://github.com/jamorham/xDrip-plus/blob/master/Documentation/WatchGuide.md).

*NB: you can also use [Tasker](#xdrip-with-tasker).*

### [AndroidAPS](https://androidaps.readthedocs.io/en/latest/EN/Installing-AndroidAPS/Building-APK.html)

For AndroidAPS [here](https://androidaps.readthedocs.io/en/latest/EN/Configuration/Watchfaces.html#aaps-on-wear-os-smartwatch).

### [NightWear](https://github.com/rahim/nightwear)

NightWear is a minimal Wear OS watch face and complication available in the [Google Play Store](https://play.google.com/store/apps/details?id=im.rah.nightwear) directly from your watch.

It uses Wear's standalone app support, so requires no companion app installed on the phone, or no phone at all as long as the watch has an internet connection. This also means it's possible to display Nightscout data on a Google Wear OS watch paired with an Apple iPhone.

</br>

## Amazfit Pace & Stratos (obsolete)

These watches are obsolete. If you still own one, an xDrip widget by Klaus3d3 is available on [GitHub](https://github.com/Klaus3d3/XdripWidgetForAmazfit-Klaus) with its installation instructions.

</br>

## Xiaomi Mi Band & Amazfit (WatchDrip+)

[WatchDrip+](https://watchdrip.org/) by Artem (bigdigital) is a companion app to [xDrip](https://github.com/NightscoutFoundation/xDrip/releases): it pushes glucose, delta, trend and treatment data to Xiaomi and Amazfit watches as soon as a new reading arrives. It can also get its data from AndroidAPS. See [Artem's blog](https://bigdigital.home.blog/) for setup instructions and the [GitHub repository](https://github.com/bigdigital/watchdrip) for downloads.

Currently supported devices:

- **Direct connection**: Xiaomi MiBand 2, 3, 4, 5 and 6; Amazfit GTR 47mm and 42mm, GTR2, GTR2e, GTS2, GTS2e, GTS2 Mini, Band 5, Bip, Bip Lite, Bip S, Bip S Lite, T-Rex Pro.
- **Zepp OS watches**: Amazfit Active, Active 2, Active Max, Balance family, Band 7, Bip 5, Bip 6, Cheetah family, Falcon, GTR 3, GTR 3 Pro, GTR 4, GTR Mini, GTS 3, GTS 4, GTS 4 mini, T-Rex 2, T-Rex 3, T-Rex Ultra and more.
- **Xiaomi**: Smart Band 7, Watch 8 Pro, Watch 9, Watch 10, Redmi Watch 4.

Check [watchdrip.org](https://watchdrip.org/) for the up-to-date device list.

[GlucoDataHandler](#glucodatahandler) is an open source alternative also supporting Mi Band and Amazfit watches.

</br>

## Apple Watch

### [Nightguard](https://apps.apple.com/us/app/nightguard/id1116430352#?platform=appleWatch)

Apple Watch series 3 and above.

[GitHub](https://github.com/nightscout/nightguard)

</br>

### [sugarmate](https://sugarmate.io/)

```{admonition} Important limitation
:class: warning
**Sugarmate doesn't allow Nightscout as a data source if you included `bridge` in `ENABLE`.**
If you need this data source: enable [obscuration](/nightscout/setup_variables.md#bridge-share2nightscout-bridge) variables.
```

You can setup sugarmate as a calendar complication to display Nightscout on your Apple watch.

</br>

### [Gluco-Tracker](https://apps.apple.com/it/app/gluco-tracker/id1526976290?platform=appleWatch)

</br>

### [Loop Follow](https://www.loopandlearn.org/loop-follow/)

You can setup Loop Follow as a calendar complication to display Nightscout on your Apple watch.

</br>

## Fitbit

```{admonition} Fitbit smartwatches are being made obsolete
:class: warning
Google has discontinued the Fitbit smartwatch line: there will be no successors to the Versa 4 and Sense 2 (the Pixel Watch replaces them) and software updates are only guaranteed through 2026.</br></br>
In June 2024 Google removed third-party apps and watchfaces (including those below) from the Fitbit gallery **in the European Economic Area**: installing them from Europe requires a VPN connected to a non-EEA country.
```

### [Nightscout Monitor](https://gallery.fitbit.com/details/eaed806d-9ff5-4aa9-a2c8-518f1f852f5a)

Open source ([repository](https://github.com/sulkaharo/nsfitbit)) — Ionic/Sense/Versa/Versa 2/Versa 3/Versa Lite

### [Glance](https://gallery.fitbit.com/details/7b5d9822-7e8e-41f9-a2a7-e823548c001c)

[Web site](https://glancewatchface.com/) — Ionic/Sense/Versa/Versa 2/Versa 3/Versa 4/Versa Lite

### [Sentinel](https://gallery.fitbit.com/developer/b50ac7f5-b932-441a-be18-e258b17c736b)

Facebook group: [Sentinel](https://www.facebook.com/groups/3185325128159614) — Ionic/Sense/Versa/Versa 2/Versa Lite

### [Marclock](https://gallery.fitbit.com/details/9eacf714-5b23-40c8-9621-ded74bd9edf9)

[Instructions](https://github.com/cramis1/Marclock-with-CGM-weather/blob/master/README.md) — Ionic/Sense/Versa/Versa 2/Versa Lite

### Analog watchfaces

[Analog CGM](https://gallery.fitbit.com/details/4d7b46b1-aaba-49b4-aa10-183321014dd3), [Orbits NS](https://gallery.fitbit.com/details/44de5c81-b77c-4f90-baa8-38f3e3d28695), [Radial CGM](https://gallery.fitbit.com/details/0173730e-5381-4495-bc6e-6ec93c8df029) — Ionic/Versa/Versa 2/Versa Lite/Versa 3/Sense

</br>

## Samsung Gear Smartwatches

### xDrip with Tasker

*Note: also available for Android Wear devices*

[Instructions](https://github.com/FreDiabetics/xDrip--Tasker-Tizen-Watchface-Integration/blob/master/README.md)

</br>

### [G-Watch app](https://play.google.com/store/apps/details?id=sk.trupici.g_watch)

Facebook group: [G-Watch App](https://www.facebook.com/gwatchapp)

</br>

## Garmin Smartwatches and Computers

Several watchfaces, widgets and data fields in the [Garmin Connect IQ store](https://apps.garmin.com/) can display your Nightscout data on Garmin watches and Edge cycling computers. Install them with the Garmin Connect IQ app on your phone and configure your Nightscout URL and token in the app settings.

### [CGM Connect](https://apps.garmin.com/en-US/developer/2609a36a-c06d-4386-9fe6-5c2dc7d702f1/apps) (bruder_jakob)

Watchface, widget and data field supporting Nightscout, Dexcom Share, LibreLinkUp, xDrip and more. Configured entirely from the Garmin Connect app settings, works with both Android and iPhone.

### [xDrip/Nightscout watchfaces](https://apps.garmin.com/en-US/developer/f9420c47-810f-47ac-a7dd-9fa7b8ecd22d/apps) (andreas-may)

Watchfaces, widgets and data fields reading from Nightscout or directly from xDrip on your phone over the local network (enable the xDrip Web Service), so no internet connection is needed. Also works with GlucoDataHandler.

### [NightscoutWatch2 and NightscoutData2](https://apps.garmin.com/en-US/developer/e985e9ec-bcf6-4aef-bfe9-77c1c93fc854/apps) (Horsetooth)

Watchface and data field displaying glucose from your Nightscout site or from xDrip.

### [CGM Gauge](https://apps.garmin.com/en-US/developer/b61690c3-5e5c-4c4e-afe9-434db16542a9/apps) (RoboleoApps)

Gauge-style watchface, widget and data field for xDrip and Nightscout: customizable ranges and previous readings visible for the trend at a glance.

### [CGM+](https://watchface.io/docs/cgm-glucose-monitors) (watchface.io)

Data field for watchface.io watchfaces supporting Nightscout, Dexcom, Libre, xDrip and AAPS.

### [WatchDrip+](https://bigdigital.home.blog/)

Also supports some Garmin watches, fed directly by xDrip or AndroidAPS on an Android phone (readings arrive instantly, without the Connect IQ update cycle).

### More watchfaces

By [Fredrik_S](https://apps.garmin.com/en-US/developer/c3842ca7-a645-4758-b9ed-4ee6f8e3abec/apps), [John_](https://apps.garmin.com/en-US/developer/b2d30711-2708-4f3a-8e83-009c16d07081/apps) and [floheigl](https://apps.garmin.com/en-US/apps/488ffa72-5994-4d0f-90ff-3eeb99f3ea41).

The apps by [Phimby](https://apps.garmin.com/en-US/developer/74d80f40-f80a-45c2-b934-321cc86f9dac/apps) are legacy: unmaintained for years, they only work with outdated hosting platforms.

</br>

## Karoo/Karoo 2

By [Henry Haspden](https://github.com/haspden/INFLITE-TYPE-ONE-Hammerhead-CGM#readme)

</br>
