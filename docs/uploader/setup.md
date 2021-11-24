# Uploaders setup

</br>

!!! note
    You usually should express the Nightscout URL in secure **https://**, not only http://.  (Unless you set `INSECURE_USE_HTTP` to `true`)

------

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/Heroku.png" style="zoom:80%;" />

Your `Nightscout URL` defined in Heroku by your App name, is the one that shows when you open your Nightscout site in a browser.

<img src="../../nightscout/img/SetupNS44.png" style="zoom:80%;" />

Your Nightscout password, is the `API_SECRET` variable you can find editing your Heroku variables like [this](../../nightscout/new_user/#editing-config-vars-in-heroku).

------

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/T1Pal.png" style="zoom:80%;" />

You will find the `Uploader url` and `Api Secret` required to configure your uploader [here](https://www.t1pal.com/account/sites/my#Uploaders).

------

</br>

## Dexcom

You need at least one follower to use Dexcom Share.

!!!note  
    If you use a DIY closed loop system it is recommended that you let it upload to Nightscout instead of importing data using Dexcom Share and the `bridge` plugin.

On your master phone, touch the Share icon, enable Sharing. If you have no follower, add one. You can also invite yourself.

<img src="../img/UploadCFG09.png" style="zoom:60%;" />

</br>

------

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/Heroku.png" style="zoom:80%;" />

In order to use the Dexcom Share servers to upload to Nightscout, you need to setup (and if not present add) the following variables in Heroku:

From `Settings`, click on the  `Reveal Config Vars`

<img src="../../nightscout/img/config-vars.png" width="800">

</br>

Verify, update or add these variables:

<img src="../../nightscout/img/NewNS35.png" style="zoom:80%;" />

</br>

You need to add `bridge` in the `ENABLE` variable. Do not delete other entries, just add `bridge` after a space.

<img src="../../nightscout/img/NewNS38.png" style="zoom:80%;" />

</br>

!!!info "MOST COMMON ERRORS"
    The most common error on initial Nightscout setups is that people incorrectly use an old account or an old password. To test your username and password, go to Dexcom's Clarity page (check [here for USA accounts](https://clarity.dexcom.com) and [here for the others](https://clarity.dexcom.eu)) and try logging in to your Dexcom account. If your account info isn't valid, or you don't see any data in your Clarity account... you need to figure out your actual credentials before moving ahead. See [here](../../troubleshoot/dexcom_bridge/) for troubleshooting tips and information on your Dexcom account.

!!! note "Password"
    *Some people have had problems with their bridge connecting when their Dexcom passwords are entirely numeric. If you have connection issues in that case, try changing your password to something with a mix of numbers and letters.*

</br>

------

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/T1Pal.png" style="zoom:80%;" />

For hosted Nightscout put your Dexcom credentials [in Dexcom Bridge](https://www.t1pal.com/account/sites/my#DataIngress).

------

</br>

## Medtronic CareLink

!!!warning "This plugin is **NOT** functional anymore with Heroku."

You can use an Android phone with a [private version of xDrip+](https://github.com/benceszasz/xDripCareLinkFollower) (see also [here](https://bigdigital.home.blog/category/xdrip/) for a customized version for smartbands), a [computer](https://github.com/FredMK/minimed-connect-to-nightscout-wrapper) or a [Raspberry Pi](https://github.com/psonnera/minimed-connect-to-nightscout-wrapper/wiki) to bridge CareLink to Nightscout.

Plugin setup documented [here](https://github.com/nightscout/cgm-remote-monitor/#mmconnect-minimed-connect-bridge) with [additional fields](https://github.com/nightscout/cgm-remote-monitor/#pump-pump-monitoring) for your pump.

</br>

## [Medtronic 600 Series with uploader](http://pazaan.github.io/600SeriesAndroidUploader/)

<img src="../img/UploadCFG08.png" style="zoom:60%;" />

You can also use [this QR code generator](https://nightscout.github.io/pages/configure/) and the menu item `Scan NS-Autoconfig QR Code` to copy the information.

For hosted Nightscout you'll find the QR code generator in [Uploaders](https://www.t1pal.com/account/sites/my#Uploaders), select the `HTTP` tab.

You might want to setup [additional fields](https://github.com/nightscout/cgm-remote-monitor/#pump-pump-monitoring) for your pump.

Facebook Group [Nightscout for Medtronic](https://www.facebook.com/groups/NightscoutForMedtronic)

</br>

## [xDrip+](https://jamorham.github.io/#xdrip-plus)

!!! info "Mind the syntax!"
    **`https://API_SECRET@mysite.herokuapp.com/api/v1/`**

<img src="../img/UploadCFG00.png" style="zoom:80%;" />

Facebook Group [xDrip](https://www.facebook.com/groups/xDripG5)

For hosted Nightscout use the QR code from [Uploaders](https://www.t1pal.com/account/sites/my#Uploaders) after selecting the `XDrip` tab.

</br>

## [Glimp](https://play.google.com/store/apps/details?id=it.ct.glicemia)

<img src="../img/UploadCFG02.png" style="zoom:80%;" />

</br>

## [Diabox](https://www.bubblan.org/diabox/)

<img src="../img/UploadCFG03.png" style="zoom:80%;" />

</br>

## [LinkBluCon](https://www.ambrosiasys.com/our-products/linkblucon/)

<img src="../img/UploadCFG04.png" style="zoom:80%;" />

</br>

## [Tomato](http://tomato.cool/)

<img src="../img/UploadCFG05.png" style="zoom:60%;" />

</br>

## [Spike](https://spike-app.com/)

Look [here](https://github.com/SpikeApp/Spike/wiki/Spike-Follower-Mode#configure-spike-master).

<img src="../img/UploadCFG10.png" style="zoom:45%;" />

Facebook group [Spike App](https://www.facebook.com/groups/spikeapp)

</br>

## [xDrip4iOS](https://testflight.apple.com/join/6ZqKUGpm)

<img src="../img/UploadCFG06.png" style="zoom:50%;" />

Facebook group [xDrip4iOS](https://www.facebook.com/groups/853994615056838/)