# New T1Pal Users

</br>

### What Is T1Pal ?

T1Pal provides an always maintained and updated Nightscout site.

- **Privacy**. Unlike DIY, the default T1Pal site is private. Only the account owner can view Nightscout.
- Getting started guide explains getting glucose and insulin data into Nightscout.
- Storage is managed, never worry about MongoDB again.
- Unlimited Shares: Unlike most apps, there is no installation required for sharing Nightscout. Create as many secret sharing links as you like and share them with anyone you want. Revoke or delete access any time.

We make the technology behind Nightscout and manage it for you. There are some important differences between T1Pal and DIY. While most plugins are available, there are a few interacting with third party services that are on our future roadmap. See our [FAQ on differences between T1Pal DIY](https://t1pal.com/legal/faq_8_18_2020_13_38#compare-to-nightscout) for the full details.

</br>

------

#### **Here is an overview of the sequence required to create your Nightscout site with T1Pal .**

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../../vendors/img/T1Pal.png" style="zoom:80%;" />

------

</br>

## Create an account

</br>

Click this link [https://t1pal.com/getting-started/starting/home](https://t1pal.com/getting-started/starting/home)

Select `Select Plan`

<img src="..\img\T1Pal01.png" style="zoom:80%;" />

</br>

Sign up with a Google account (create one if necessary)

<img src="..\img\T1Pal02.png" style="zoom:80%;" />

</br>

Select a username, confirm mail and accept conditions. Click `Create My Account`

<img src="..\img\T1Pal03.png" style="zoom:80%;" />

</br>

Enter your billing information and `Confirm`

</br>

## Configure your data source

</br>

!!!note  
     If you use a DIY closed loop system it is recommended that you let it upload to Nightscout instead of importing from Dexcom Share.

</br>

Select your data source

<img src="..\img\T1Pal04.png" style="zoom:80%;" />

</br>

If you use a Dexcom sensor enter your Clarity credentials then `Save connection`

<img src="..\img\T1Pal05.png" style="zoom:80%;" />

</br>

If you're using another uploader select `review details`

<img src="..\img\T1Pal06.png" style="zoom:80%;" />

Then `start uploading` in the `Using Nightscout uploaders?` section

<img src="..\img\T1Pal07.png" style="zoom:80%;" />

</br>

Select `Create uploader`

<img src="..\img\T1Pal08.png" style="zoom:80%;" />

</br>

In the upper part you'll find your Nightscout API_SECRET and below the URL, copy and paste them in your uploader. Refer to [uploader settings here](../../../uploader/setup).

<img src="..\img\T1Pal09.png" style="zoom:80%;" />

</br>

If you're uploading from xDrip+ you can scan the QR code like this:

<img src="..\img\T1Pal11.png" style="zoom:80%;" />

<img src="..\img\T1Pal10.png" style="zoom:80%;" />

</br>

## Enable a treatments data source

</br>

If your uploader sends treatments (insulin, carbs, basal, ...) you can visualize therapy.

<img src="..\img\T1Pal12.png" style="zoom:80%;" />

</br>

Enable `Visualize therapy` and select the data source, `Save changes`.

</br>

## View your site and create a new profile

</br>

From your account home, go to `Visit my Nightscout`

<img src="..\img\T1Pal13.png" style="zoom:80%;" />

</br>

Upon first access you will be required to create a new profile. Select `OK`

<img src="..\img\T1Pal14.png" style="zoom:80%;" />

</br>

File all required fields as shown [here](../../../nightscout/profile_editor/).

Make sure you enter your correct time zone.

You're automatically authenticated when accessing your site from the T1Pal portal.

</br>

## Configure more settings

If you need to customize your site you can find some Nightscout variables in your [Control Panel](../control_panel).