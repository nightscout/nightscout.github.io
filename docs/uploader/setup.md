# Uploaders setup

</br>

!!! note
    You usually should express the Nightscout URL in secure **https://**, not only http. 

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

Log in Heroku.

From `Settings`, click on the  `Reveal Config Vars`

<img src="../../nightscout/img/config-vars.png" width="800">

</br>

You need to add `mmconnect` in the `ENABLE` variable. Do not delete other entries, just add `bridge` after a space.

<img src="../../nightscout/img/NewNS38.png" style="zoom:80%;" />

If you want to link your CareLink account as a data source, compile the following lines:

<img src="../../nightscout/img/NewNS36.png" style="zoom:80%;" />

You might want to setup [additional fields](https://github.com/nightscout/cgm-remote-monitor/#pump-pump-monitoring) for your pump.

</br>

## Medtronic 600 Series with uploader

<img src="..\img\UploadCFG08.png" style="zoom:60%;" />

You might want to setup [additional fields](https://github.com/nightscout/cgm-remote-monitor/#pump-pump-monitoring) for your pump.

</br>

## xDrip+

!!! info "Mind the syntax!"
    **https://APISecret@SiteURL.herokuapp.com/api/v1/**

<img src="..\img\UploadCFG00.png" style="zoom:80%;" />

</br>

## Glimp

<img src="..\img\UploadCFG02.png" style="zoom:80%;" />

</br>

## Diabox

<img src="..\img\UploadCFG03.png" style="zoom:80%;" />

</br>

## LinkBluCon

<img src="..\img\UploadCFG04.png" style="zoom:80%;" />

</br>

## Tomato

<img src="..\img\UploadCFG05.png" style="zoom:60%;" />

</br>

## Spike

Look [here](https://github.com/SpikeApp/Spike/wiki/Spike-Follower-Mode#configure-spike-master).

</br>

## xDrip4iOS

<img src="..\img\UploadCFG06.png" style="zoom:60%;" />