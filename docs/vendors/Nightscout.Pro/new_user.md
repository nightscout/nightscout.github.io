# What to expect when you subscribe to Nightscout Pro


## TL;DR

[Nightscout.Pro](https://nightscout.pro/) is a completely 'hands-off' Nightscout hosting service which you can get started with no configuration required. You can subscribe directly via the website which has been translated in various languages and offer payment options in various local currencies.

Simply sign-up and you will receive an email once your site has been set up with the details.

**Pricing per month**
<table>
    <tr>
        <td>Currency</td>
        <td>Price</td>
    </tr>
    <tr>
        <td>GBP</td>
        <td>£3</td>
    </tr>
    <tr>
        <td>USD</td>
        <td>$4</td>
    </tr>
    <tr>
        <td>EUR</td>
        <td>€4</td>
    </tr>
    <tr>
        <td>PLN</td>
        <td>18 zł</td>
    </tr>
</table>



## My Background

Hi, I’m Andy Low – I’m a web developer based in Scotland, UK. I was diagnosed back in 2004 as a Type 1 Diabetic at the age of 13. As I’m sure some of you can relate, I was in denial. I mistreated my diabetes and pretended like it didn’t exist. 

It was tough. So many factors need to be considered:- What have I eaten today? How many carbs? Protein? Am I planning on doing any exercise in the next few hours? Do I already have COB or IOB? The list goes on.

Anyway, fast forward 13 years, three trips to the hospital with DKA and several other health complications as a result of my own negligence, I came across an online movement around 2017. Yep, You guessed it – #WeAreNotWaiting.

I was reading about how to turn the Freestyle Libre sensor into a CGM, store that data in the cloud and even operate a closed-loop DIY APS system. This completely blew my mind, and I was hooked. 

I spoke with my healthcare team about this; luckily, they were happy to talk about it and even supported me in getting a loop-compatible pump. This was a game-changer. My HbA1c went from an “off-the-chart” 145 (16.5) to an “almost non-diabetic” reading of 54 (7.4) over the space of about a year. 

This technology has truly been life-changing for me, and I want to give the same gift to as many other diabetics as I can!

<img src="https://nightscout.pro/wp-content/uploads/2022/12/profile-pic-red-blue.jpg" width="320px" height="320px">


## Introducing Nightscout.pro

When I first learned about the magic of DIY diabetes technology, I had no idea how to write code. Luckily the people who did know had taken the time to carefully write step-by-step instructions on how to set things up, and I could blindly copy and paste this into Heroku and get a working copy of Nightscout up and running.

However, as I and many others have found, Any simple mistake doing this could take the whole system down and then you’re into troubleshooting territory, which can be painful. 

The community is run by heroes, in my opinion. People are giving up their free time to #PayItForward and help muggles like me get through their problems and get things working.

Since setting up my own system in 2017, One thing led to another. I have now moved into a position where I do know how to code my own websites and applications using a variety of languages like PHP, JavaScript, SQL etc. and have found myself in a position where I can give something back, and that’s why nightscout.pro was born.

Heroku announced they will sunset their free tier plans at the end of November 2022. As a result, thousands of people with diabetes worldwide either had to pay up to $7 per month to keep their service operational with Heroku or migrate their nightscout site to another platform where, for the time being, they can continue on a free tier. But how long would this last?

I am, and always will be, an advocate of the DIY (and hopefully free) nightscout approach. And am happy to help others achieve this. But I want to offer a simple, low-cost solution for people who wish to avoid the hassle of migrating or configuring their Nightscout site from scratch.

Nightscout.pro is an entirely hands-off way of starting (or migrating) your nightscout site. I manage the platform myself. On servers I have full, root access to and control.

Please understand that, at least at the time of writing this, It is just me here. The process is still somewhat manual. And your requests for support are answered by me, and only me. I aim to get back to you quickly. However, depending on the time of day, it could take me some time to respond.

 

## What Happens when I sign up?

When you sign up for Nightscout via this service, we ask you for some basic information, the only data we need to get most folks up and running.

This is done deliberately to make the process as quick and painless as possible, and I am open to suggestions for improving this for everyone.

At the time of writing, your order details are confirmed and sent by email to me. I use a pre-defined script on my server, which allows me to set up your nightscout site quickly. The process takes about 2 minutes, but it requires me to “hit the button” to kick things off, at least for now.

For this reason, the time it takes from when you order to your site being fully operational can vary from just a few minutes to up to 24 hours. I check my emails frequently throughout the day, but I also have other things to do, so please understand and be patient. 

Your Nightscout site will be set up with some basic “default” configurations as detailed below, but if you would like other features provided or changes to this configuration, please email support at support@nightscout.pro, and I can make this change for you.

 

 

## The Default Setup

Each Nightscout site will be set up with some “default” settings. These are currently:

   – ‘BG_HIGH=180’

   – ‘BG_LOW=70’

   – ‘BG_TARGET_BOTTOM=70’

   – ‘BG_TARGET_TOP=180’

   – ‘CUSTOM_TITLE=Nightscout’

   – ‘DEVICESTATUS_ADVANCED=true’

   – ‘ENABLE=food loop pump careportal basal bwp iob cob sage delta direction upbat timeago profile rawbg basal alexa maker cage iage bgi openaps bridge’

   – ‘TIME_FORMAT=24’

   – ‘THEME=colors’

   – ‘BASAL_RENDER=default’

   – ‘AUTH_DEFAULT_ROLES=denied’

 

These settings suit most people, but if you have other preferences, please email support, and I can easily change them for you. Also, if there is a better way, let me know, and I can update this approach for the benefit of everyone.

If you’d like to use other High and Low targets, you can change these settings within the app without needing me to update them in the configuration. However, any changes you make in the app will only be persistent if you use the same browser and don’t delete your cache. If you want the change to be persistent across all devices, you can email support, and I’ll update the config.

For information about all available variables, please see the official documentation for Nightscout Configuration.

Note: If you wish to use Dexcom Bridge as a BG source, you can enter your Dexcom login details when you place your order. All personal information will be held in the strictest confidence and secured, so only I and any company employees will have access to this data.




## Remote Overrides & Loop

Nightscout.pro currently supports the use of remote overrides with Loop. Please proceed with caution and only use this feature if you are an experienced looper and know what you are doing. To enable this feature, please email support and provide the following config vars as detailed in the official loopdocs.

<img src="https://nightscout.pro/wp-content/uploads/2022/12/override_vars_complete.png" width="900px">


## Data Transfer

Some Facebook support groups asked a common question about how to keep and transfer existing Nightscout data to a new instance.

I have created the data transfer tool to address and resolve this issue. It is freely available for anyone with a nightscout site hosted with nightscout.pro or any other host.

When using the tool, you must enter your old Nightscout site URL. If your old site had AUTH_DEFAULT_ROLES set to ‘denied’ (meaning you had to enter your API SECRET to view the data), then you’d need to enter your old API SECRET too. Enter your new URL and new API SECRET, and you can quickly transfer profile, entries and treatment data between Nightscout instances.

<img src="https://nightscout.pro/wp-content/uploads/2022/12/Screenshot-2022-12-27-at-14.38.56.jpg" width="500px">


## Setting up companion apps

Nightscout is a data collection and storage tool. Therefore, it needs to be “fed” data to be valuable to its users.

There are many ways you can achieve this, and while I try my best to keep up to date with most methods, I am only human and only know as much as I know. 

Your Nightscout site will be set up in a standard way as if you had followed the DIY method. I impose no restrictions. 

I can help you work through any difficulties setting up your data feeds. Please also refer to the official documentation for whichever companion apps you are trying to set up.

## Support
Support is currently offered via [Email](mailto:support@nightscout.pro), [Facebook](https://www.facebook.com/nightscoutpro) or [Discord](https://discord.gg/7hYrkqVavU)
