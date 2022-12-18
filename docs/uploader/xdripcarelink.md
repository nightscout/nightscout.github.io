# xDrip+ for CareLink

Since the `mmconnect` plugin is not functional anymore, the best solution to upload automatically your data from CareLink to Nightscout is to use the forked version of xDrip+ from Bence.

</br>

You need an Android device to act as a bridge from CareLink to Nightscout.  
It can be either the phone you use with the CareLink app, or any other phone or tablet connected to the internet. You don't need to carry it with you. It only needs to be switched on and connected.

There will be a delay between your pump readings and xDrip+/Nightscout. This is due to various polling times and should be less than 10 minutes.

</br>

Download xDrip+ from **[here](https://github.com/NightscoutFoundation/xDrip/releases)** (use the latest pre-release).  

Once downloaded install xDrip+ (you can find information [here](https://xdrip.readthedocs.io/en/latest/install/install/#enable-location)).

Make sure you setup a Share Partner on your CareLink Connect app.

Select the [CareLink follower](https://xdrip.readthedocs.io/en/latest/install/carelinkfollow/) as the data source.

Once you have data in xDrip+ you can upload them to Nightscout using Cloud Upload, [Nightscout Sync](https://xdrip.readthedocs.io/en/latest/use/cloud/#nightscout-sync-rest-api).

Leave Download treatments disabled.

</br>



