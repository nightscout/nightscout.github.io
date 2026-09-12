---
orphan: true
---

# </br>

a) Click on the `Deploy on Railway` button below:

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template/6v8Ejj)

***Note:*** *this is a private template as the community doesn't have a Railway account.  
It doesn't include any referral code.*

</br>

b) If you see this screen, select `Connect GitHub to Deploy`.

<img src="/vendors/railway/img/Railway07a.png" width="400px" /></br>

Then select `Authorize Railway App`.

<img src="/vendors/railway/img/Railway02.png" width="400px" /></br>

</br>

c) Click `Configure`

<img src="/vendors/railway/img/Railway07.png" width="400px" /></br>

</br>

d) Click `Install & Authorize`

<img src="/vendors/railway/img/Railway08a.png" width="400px" /></br>

</br>

e) You will then see this page, scroll down to define the [required variables](/nightscout/setup_variables.md#required-variables) for creating your Nightscout site.

<img src="/vendors/railway/img/Railway09.png" width="400px" /></br>

</br>

Mind if you see this you must [delete the`cgm-remote-monitor` fork in GitHub](/update/redeploy.md#delete-your-own-fork-of-cgm-remote-monitor) and retry `Deploy` from **a)** afterwards.

<img src="/vendors/railway/img/Railway17.png" width="400px" /></br>

</br>

f) Setup your Nightscout core variables.

```{admonition} Migrating from Heroku
If you're migrating your project from Heroku, [display all variables in Heroku](/vendors/heroku/new_user.md#editing-config-vars-in-heroku) and copy all those with a value into Railway.  
See below how to add variables in Railway but use your Heroku variables values.
```

`API_SECRET` will be your Nightscout site password, it needs to be at least 12 characters long and you should **NOT use spaces** if you use @ or ! symbols remember you will probably need to express them using [Percent encoding](https://en.wikipedia.org/wiki/Percent-encoding#Percent-encoding_reserved_characters) in your uploader and downloader apps. If you're not sure on how to do this, it is recommended to use only letters (uppercase + lowercase) and digits.

```{warning}
The API_SECRET is the **main password allowing full access to your Nightscout site**. Make sure it's reasonably secure (mix uppercase and lowercase letters, plus digits) and **do no not share it publicly**. If you think you exposed it by mistake, it is recommended that you **change it**.
```

<img src="/vendors/railway/img/Railway10.png" width="600px" /></br>

g) At **Step 3** you created your database and came back with a MONGODB_URI string. Time has come to use it here.  

<img src="/vendors/railway/img/Railway21.png" width="600px" /></br>

</br>

**Dexcom Bridge**

h) If you use [Dexcom `bridge`](/troubleshoot/dexcom_bridge/) you need to configure these two variables with your Dexcom credentials:

<img src="/vendors/railway/img/Railway33.png" width="600px" /></br>

<img src="/vendors/railway/img/Railway34.png" width="600px" /></br>

If you're using Dexcom Share in the US you should put **US**, in **any other case it must be EU**.  
If you don't see it proposed at this point you'll need to **browse the list below to find it and modify it**.

<img src="/vendors/railway/img/Railway36.png" width="600px" /></br>

**Remember to add `bridge` at the end of the `enable` variable in the list below.**

</br>

```{admonition} MOST COMMON ERRORS
:class: hint
The most common error on initial Nightscout setups is that people incorrectly use an old account or an old password. To test your username and password, go to Dexcom's Clarity page (check [here for USA accounts](https://clarity.dexcom.com) and [here for the others](https://clarity.dexcom.eu)) and try logging in to your Dexcom account. If your account info isn't valid, or you don't see any data in your Clarity account... you need to figure out your actual credentials before moving ahead. See [here](/troubleshoot/dexcom_bridge/) for troubleshooting tips and information on your Dexcom account.
```

```{admonition} Password
:class: note
*Some people have had problems with their bridge connecting when their Dexcom passwords are entirely numeric. If you have connection issues in that case, try changing your password to something with a mix of numbers and letters.*
```

```{hint}
You need to have at least one follower to use Dexcom Share. See [here](/uploader/setup.md#dexcom).
```

</br>

i) Many optional variables are already setup for you, open the caret to see them and eventually modify them (**recommended**).

<img src="/vendors/railway/img/Railway15.png" width="600px" /></br>

</br>

Select the units you’re using in `DISPLAY_UNITS` acceptable choices are `mg/dl` or `mmol/L` (or just `mmol`).

<img src="/vendors/railway/img/Railway13.png" width="600px" /></br>

</br>

You can update the alarms values. See [here](/nightscout/setup_variables.md#alarms) for the meaning of each one.

<img src="/vendors/railway/img/Railway37.png" width="600px" /></br>

</br>

If you want to ensure that ONLY someone with permission to view your site (e.g., a token or the `API_SECRET`) is able to view the data, you should configure the [`AUTH_DEFAULT_ROLES`](auth_default_roles) variable in as `denied`.  
If you want your site to be visible to anybody leave it as `readable`.

<img src="/vendors/railway/img/Railway11.png" width="600px" /></br>

</br>

A common list of [`enable`](enable) variables is predefined, you can change them if you know why.  
It's recommended that you leave them like this for now.

Just remember to add `bridge` at the end if your get your BG values from Dexcom Share.

<img src="/vendors/railway/img/Railway14.png" width="600px" /></br>

</br>

You can modify the variables values, check the [documentation](/nightscout/setup_variables) for the meaning of each one.  
Make sure you don't make typo errors, some will crash your site (like for example `LANGUAGE` value in upercase).

</br>

j) You can now `Deploy`, and wait until it is complete.

<img src="/vendors/railway/img/Railway16.png" width="400px" /></br>

If you see this message, deploy didn't complete, let's fix this manually.

<img src="/vendors/railway/img/Railway41.png" width="400px" /></br>

j1)  Select `Settings` and scroll down to `Service`.  
Disconnect your `Source Repo` with the cross at the end of the line.

<img src="/vendors/railway/img/RailwayT01.png" width="600px" /></br>

j2) Confirm `Disconnect`.

<img src="/vendors/railway/img/RailwayT02.png" width="400px" /></br>

</br>

j3) Select `Connect Repo`.

<img src="/vendors/railway/img/RailwayT03.png" width="400px" /></br>

You should be able to select your GitHub `cgm-remote-monitor` repository.

<img src="/vendors/railway/img/RailwayM03.png" width="400px" /></br>

Your Railway app will now automatically deploy.

</br>

</br>

```{admonition} Recommended
:class: hint
You should [change your Railway site name](#change-your-nightscout-site-name) now in order to make it easier to remember.
You can also do this later, **before setting your uploaders**.
```

</br>
