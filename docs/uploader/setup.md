# Uploaders setup

</br>

!!! note
    You usually should express the Nightscout URL in secure **https://**, not only http://.  (Unless you set `INSECURE_USE_HTTP` to `true`)

</br>

## Dexcom

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
    The `BRIDGE_PASSWORD` and `BRIDGE_USER_NAME` are NOT visible from within your Dexcom app or online account. The values for them are what you entered into your Dexcom mobile app when you VERY FIRST logged into that app however long ago. The `BRIDGE_USER_NAME` is not an email address. The most common error on initial Nightscout setups is that people incorrectly use an old account or an old password. To test your username and password, go to Dexcom's Clarity page (check [here for USA accounts](https://clarity.dexcom.com) and [here for the others](https://clarity.dexcom.eu)) and try logging into your Dexcom account. If your account info doesn't let you in, or you don't see data in your Clarity account...then you need to figure out your actual credentials before moving ahead.

!!! note "Password"
    *Some people have had problems with their bridge connecting when their Dexcom passwords are entirely numeric. If you have connection issues in that case, try changing your password to something with a mix of numbers and letters.*

</br>

You need at least one follower to use Dexcom Share.

On your master phone, touch the Share icon, enable Sharing. If you have no follower, add one. You can also invite yourself.

<img src="..\img\UploadCFG09.png" style="zoom:60%;" />

</br>

## Medtronic CareLink

!!!warning "This plugin is **NOT** functional anymore with Heroku."

Plugin setup documented [here](https://github.com/nightscout/cgm-remote-monitor/#mmconnect-minimed-connect-bridge) with [additional fields](https://github.com/nightscout/cgm-remote-monitor/#pump-pump-monitoring) for your pump.

</br>

## [Medtronic 600 Series with uploader](http://pazaan.github.io/600SeriesAndroidUploader/)

<img src="..\img\UploadCFG08.png" style="zoom:60%;" />

You might want to setup [additional fields](https://github.com/nightscout/cgm-remote-monitor/#pump-pump-monitoring) for your pump.

Facebook Group [Nightscout for Medtronic](https://www.facebook.com/groups/NightscoutForMedtronic)

</br>

## [xDrip+](https://jamorham.github.io/#xdrip-plus)

!!! info "Mind the syntax!"
    **`https://API_SECRET@HerokuAppName.herokuapp.com/api/v1/`**

<img src="..\img\UploadCFG00.png" style="zoom:80%;" />

Facebook Group [xDrip](https://www.facebook.com/groups/xDripG5)

</br>

## [Glimp](https://play.google.com/store/apps/details?id=it.ct.glicemia)

<img src="..\img\UploadCFG02.png" style="zoom:80%;" />

</br>

## [Diabox](https://www.bubblan.org/diabox/)

<img src="..\img\UploadCFG03.png" style="zoom:80%;" />

</br>

## [LinkBluCon](https://www.ambrosiasys.com/our-products/linkblucon/)

<img src="..\img\UploadCFG04.png" style="zoom:80%;" />

</br>

## [Tomato](http://tomato.cool/)

<img src="..\img\UploadCFG05.png" style="zoom:60%;" />

</br>

## [Spike](https://spike-app.com/)

Look [here](https://github.com/SpikeApp/Spike/wiki/Spike-Follower-Mode#configure-spike-master).

Facebook group [Spike App](https://www.facebook.com/groups/spikeapp)

</br>

## [xDrip4iOS](https://testflight.apple.com/join/6ZqKUGpm)

<img src="..\img\UploadCFG06.png" style="zoom:60%;" />

Facebook group [xDrip4iOS](https://www.facebook.com/groups/853994615056838/)