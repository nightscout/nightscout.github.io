# Nightscout on your Watch

</br>

## Pebble Smartwatches

<img src="/nightscout/img/PebbleNSFoundation.jpeg" width="400px" />

Pebble smartwatch use is a historic milestone of CGM in the Cloud. Pebble has been bought by Fitbit in 2016 and necessary resources have moved to archives and [rebble.io](https://rebble.io/). Pebble support is still maintained in Loop, AndroidAPS, FreeAPS and xDrip+.

You still can find the Pebble app for iOS in the [Apple Store](https://apps.apple.com/us/app/pebble/id957997620). For Android you need to download it from [APKMirror](https://www.apkmirror.com/apk/pebble-technology-corp/pebble/pebble-4-4-2-1405-62d45d7d7-endframe-release/pebble-4-4-2-1405-62d45d7d7-endframe-android-apk-download/) or [APKPure](https://apkpure.com/it/pebble/com.getpebble.android.basalt).

For authentication and getting the watchfaces, the original server closed so you'll need to register with [Rebble](https://auth.rebble.io/auth/).

You'll find Nightscout watchfaces [here](https://apps.rebble.io/en_US/search/watchfaces/1). Search for Nightscout, CGM, ... 

Configure the watchface with your Nightscout site URL.

</br>

### [urchin](https://github.com/mddub/urchin-cgm)

A Pebble watchface to view data from a continuous glucose monitor in graph format.

</br>

If you want to use your Pebble with Loop look [here](https://loopkit.github.io/loopdocs/nightscout/pebble/), for AndroidAPS [here](https://androidaps.readthedocs.io/en/latest/EN/Configuration/Watchfaces.html#pebble) and FreeAPS [here](https://github.com/mddub/pancreabble).

</br>

### [xDrip+](https://github.com/NightscoutFoundation/xDrip/releases)

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



````

</br>

### [xDrip+](https://github.com/NightscoutFoundation/xDrip/releases)

Enable Android Wear Integration to send xDrip+ BG to the smartwatch. Do not enable neither Collection nor Force Collection.

<img src="/nightscout/img/Watch00.png" width="800px" />

Full xDrip+ wear documentation [here](https://github.com/jamorham/xDrip-plus/blob/master/Documentation/WatchGuide.md).

*NB: you can also use [Tasker](#xdrip-with-tasker).*

### [AndroidAPS](https://androidaps.readthedocs.io/en/latest/EN/Installing-AndroidAPS/Building-APK.html)

For AndroidAPS [here](https://androidaps.readthedocs.io/en/latest/EN/Configuration/Watchfaces.html#aaps-on-wear-os-smartwatch).

### [Glimp](https://play.google.com/store/apps/details?id=it.ct.glicemia)

Select your Wearable device and enable the Glimp watchface.

<img src="/nightscout/img/Watch01.png" width="700px" />

### [NightWear](https://github.com/rahim/nightwear)

NightWear is a minimal Wear OS watch face and complication available in the [Google Play Store](https://play.google.com/store/apps/details?id=im.rah.nightwear) directly from your watch.

It uses Wear's standalone app support, so requires no companion app installed on the phone, or no phone at all as long as the watch has an internet connection. This also means it's possible to display Nightscout data on a Google Wear OS watch paired with an Apple iPhone.

</br>

## Amazfit Pace & Stratos

### [xDrip+](https://github.com/NightscoutFoundation/xDrip/releases)

- Install the [Amazfit watch app](https://play.google.com/store/apps/details?id=com.huami.watch.hmwatchmanager) on your phone.
- Install the [Amazfit tool](https://forum.xda-developers.com/t/tool-pace-stratos-verge-tool-all-in-one-drivers-unlock-twrp-factory-image.3874802/) on a Windows PC.
- Download the [widget](https://github.com/Klaus3d3/XdripWidgetForAmazfit-Klaus/releases) from the project author (Klaus3d3) GitHub [repository](https://github.com/Klaus3d3/XdripWidgetForAmazfit-Klaus).
- OEM unlock and enable USB debug on the watch, run TOOL ALL IN ONE and click the APK Installer button, select the widget apk file and INSTALL it. Close the install window and click Reboot System.
- In xDrip+, enable the Amazfit service and select the options you want to enable.

<img src="/nightscout/img/Watch04.png" width="800px" />

*Original instructions [here](https://crazyinfo.de/2018/07/25/xdrip-smartwatch-widget-fuer-amazfit-pace-stratos).*

</br>

## Xiaomi MiBand 2, 3, 4, 5 and 6

## Amazfit Band 5, Bip, Bip Lite, Bip S and Bip S lite, T-Rex Pro

## Amazfit GTR2, GTR2e, GTS2, GTS 2 mini, GTS2e, GTR42 and 47

### xDrip+

Follow Artem's instructions [here](https://bigdigital.home.blog/).

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

### [Nightscout Monitor](https://gallery.fitbit.com/details/eaed806d-9ff5-4aa9-a2c8-518f1f852f5a)

Ionic/Sense/Versa/Versa 2/Versa 3/Versa Lite

[Repository](https://github.com/sulkaharo/nsfitbit)

</br>

### [Glance](https://gallery.fitbit.com/details/7b5d9822-7e8e-41f9-a2a7-e823548c001c)

Ionic/Sense/Versa/Versa 2/Versa 3/Versa 4/Versa Lite

[Web site](https://glancewatchface.com/)

</br>

### [Sentinel](https://gallery.fitbit.com/developer/b50ac7f5-b932-441a-be18-e258b17c736b)

Ionic/Sense/Versa/Versa 2/Versa Lite

Facebook group: [Sentinel](https://www.facebook.com/groups/3185325128159614)

</br>

### [Marclock](https://gallery.fitbit.com/details/9eacf714-5b23-40c8-9621-ded74bd9edf9)

Ionic/Sense/Versa/Versa 2/Versa Lite

[Instructions](https://github.com/cramis1/Marclock-with-CGM-weather/blob/master/README.md)

</br>

### Analog watchfaces

#### [Analog CGM](https://gallery.fitbit.com/details/4d7b46b1-aaba-49b4-aa10-183321014dd3)

#### [Orbits NS](https://gallery.fitbit.com/details/44de5c81-b77c-4f90-baa8-38f3e3d28695)

#### [Radial CGM](https://gallery.fitbit.com/details/0173730e-5381-4495-bc6e-6ec93c8df029)

Ionic/Versa/Versa 2/Versa Lite/Versa 3/Sense

</br>

## Samsung Gear Smartwatches

### xDrip+ with Tasker

*Note: also available for Android Wear devices*

[Instructions](https://github.com/FreDiabetics/xDrip--Tasker-Tizen-Watchface-Integration/blob/master/README.md)

</br>

### [G-Watch app](https://play.google.com/store/apps/details?id=sk.trupici.g_watch)

Facebook group: [G-Watch App](https://www.facebook.com/gwatchapp)

</br>

## Garmin Smartwatches and Computers

By [Phimby](https://apps.garmin.com/en-US/developer/74d80f40-f80a-45c2-b934-321cc86f9dac/apps)

By [Horsetooth](https://apps.garmin.com/en-US/developer/e985e9ec-bcf6-4aef-bfe9-77c1c93fc854/apps)

By [andreas-may](https://apps.garmin.com/en-US/developer/f9420c47-810f-47ac-a7dd-9fa7b8ecd22d/apps)

By [Fredrik_S](https://apps.garmin.com/en-US/developer/c3842ca7-a645-4758-b9ed-4ee6f8e3abec/apps)

By [John_](https://apps.garmin.com/en-US/developer/b2d30711-2708-4f3a-8e83-009c16d07081/apps)

By [floheigl](https://apps.garmin.com/en-US/apps/488ffa72-5994-4d0f-90ff-3eeb99f3ea41)

</br>

## Karoo/Karoo 2

By [Henry Haspden](https://github.com/haspden/INFLITE-TYPE-ONE-Hammerhead-CGM#readme)

</br>
