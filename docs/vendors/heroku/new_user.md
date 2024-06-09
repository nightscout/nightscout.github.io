# Nightscout in Heroku

</br>

```{admonition} Too complicated? Not what you're looking for?
:class: seealso
Consider a hosted Nightscout service! Check for easier solutions [here](/index.md#nightscout-as-a-service).
```

</br>

```{card}
## Heroku
![Heroku Eco](/vendors/img/Heroku.png)
^^^
Since the [beginning](https://github.com/nightscout/cgm-remote-monitor/pull/98) Heroku has been a very popular platform for Nightscout. Most of the documentation was based on a Heroku Nightscout.  
On August 25th 2022, Salesforce decided to [drop the free plan](https://blog.heroku.com/next-chapter). 
You can create your new Nightscout site with Heroku using an Eco plan (5$/month).

**Pros**:  
* Large platform with a reliable history
* Well documented, well known by the community

**Cons**:  
* The Eco plan has the same limitations than the previous Free plan, for 5$ per month
* For a Nightscout site a 7$ per month Basic plan is not really worth it (compared to hosted solutions)
* Relying on the MongoDB Atlas database
* New sites naming add an identifier after the app name making it harder to remember
```

</br>

------

**Create your Heroku account from a computer.**

Do not change device/computer/browser during the setup process!

```{hint}
If you have unexpected issues when creating your site, restart with another browser.
```

```{admonition} If this is not your first attempt to deploy Nightscout
:class: warning
You might want to do some [cleanup](/troubleshoot/heroku.md#cleanup) before.
```

</br>


## Step 0: Create a database

```{admonition} Heroku doesn't include a database
:class: note
Make sure you [created one](/nightscout/database) before starting your Nightscout web app creation with Heroku.
Come back here when you have a MONGODB_URI connection string.
```



```{admonition} Migrating?
:class: tip
Copy the connection string from your previous platform: [edit the variables](/nightscout/setup_variables.md#nightscout-configuration) and look for `MONGODB_URI`.
If you don't see `MONGODB_URI` but see `MONGO_CONNECTION` (**NOT** `MONGO_COLLECTION`): use its value.
```

</br>

## Step 1: Create a GitHub account and fork the Nightscout project

```{tab-set}

:::{tab-item} I don't have a GitHub Account
### Create a GitHub account
::: {include} /vendors/github/create.md
:::

:::{tab-item} I already have a GitHub Account
### Update your Nightscout fork
:::{include} /vendors/github/update_b.md
:::

```

</br>

## Step 2: Create a Heroku account

</br>

```{admonition} Multiple factor authentication
:class: warning
Salesforce will insist you should enable multiple factor authentication.
While this is indeed a good idea to increase safety, should you decide to enable it, make sure:
- To **print your recovery codes** and keep them in a safe place
- To **never** delete the authenticator app on your phone.
Failure to follow these rules will end up in an account you can't log into, hance can't restart and maintain your Nightscout site.
More information [here](/vendors/heroku/mfa.md).
```

</br>

a) Click this link to create an Heroku account: [https://signup.heroku.com/login](https://signup.heroku.com/login)

b) Enter mandatory data (*) and click `CREATE FREE ACCOUNT`

<img src="/vendors/heroku/img/NewNS07.png" width="600px" />

</br>

c) Heroku will send a confirmation email, open your mail and check your inbox (check your spam-folder if not received after a couple of minutes).

<img src="/vendors/heroku/img/NewNS09.png" width="400px" />

</br>

d) Click on the activation link

<img src="/vendors/heroku/img/NewNS10.png" width="600px" />

</br>

e) Create a password, it is important that you write it down for later usage. Click `SET PASSWORD AND LOG IN`

<img src="/vendors/heroku/img/NewNS11.png" width="500px" />

</br>

f) Click `CLICK HERE TO PROCEED`

<img src="/vendors/heroku/img/NewNS12.png" width="400px" />

Read and accept Salesforce terms of service.

Se sei residente in Italia, abilita l'interruttore `Are you domiciled in Italy`, leggi e accetta le condizioni supplementari.

<img src="/vendors/heroku/img/NewNS12a.png" width="500px" />

</br>

g) Your Heroku page will open, click on your profile picture, in the top right corner, and select `Account Settings`

<img src="/vendors/heroku/img/NewNS13.png" width="600px" />

</br>

h) Click on `Billing`

<img src="/vendors/heroku/img/NewNS14.png" width="600px" />

</br>

i) Click `Add credit card`

<img src="/vendors/heroku/img/NewNS15.png" width="600px" />

</br>

j) Enter your credit card information and click `Save Details`

</br>

<img src="/vendors/heroku/img/NewNS16.png" width="400px" />

</br>

k) Subscribe to the `Eco plan` for 5$ per month. You can upgrade to Basic later if you wish.

<img src="/vendors/heroku/img/HerokuE03.png" width="600px" />

</br>

l) You should now have 2 pages open: Heroku and GitHub. Leave them open.</br></br>

## Step 3: Fork and deploy cgm-remote-monitor

a) [Fork the Nightscout cgm-remote-monitor project](/nightscout/github.md#fork-the-nightscout-project).

</br>

b) Click the `Deploy to Heroku` button below:

<a href="https://heroku.com/deploy?template=https://github.com/nightscout/cgm-remote-monitor" target="_blank"><img src="https://www.herokucdn.com/deploy/button.png"></a>

</br>

```{admonition} You're getting into the core setup of your site
:class: note
Below you'll see the minimum required configuration, you can modify the variables later in Heroku.
```

</br>

c) Enter your CGM in the Cloud site name: invent a name you will use to see your BG in the cloud. Confirm that the name is available.

```{hint}
Starting June 14th 2023, site names will include an [application name identifier](https://devcenter.heroku.com/articles/custom-domains) after your app name.
```

d) Don’t change the region.

<img src="/vendors/heroku/img/NewNS33.png" width="500px" />

</br>

Scroll down and setup the following variables:

 </br>

e) `API_SECRET` will be your Nightscout site password, it needs to be at least 12 characters long and you should **NOT use spaces** if you use @ or ! symbols remember you will probably need to express them using [Percent encoding](https://en.wikipedia.org/wiki/Percent-encoding#Percent-encoding_reserved_characters) in your uploader and downloader apps. If you're not sure on how to do this, it is recommended to use only letters (uppercase + lowercase) and digits.

```{warning}
The API_SECRET is the **main password allowing full access to your Nightscout site**. Make sure it's reasonably secure (mix uppercase and lowercase letters, plus digits) and **do no not share it publicly**. If you think you exposed it by mistake, it is recommended that you **change it**.
```

<img src="/vendors/heroku/img/NewNS34.png" width="500px" />

</br>

f) If you want to link your Dexcom Share account as a data source, complete the following lines:

```{note}
 If you use a DIY closed loop system it is recommended that you let it upload to Nightscout instead of importing using Dexcom Share and the `bridge` plugin.
```

  <img src="/vendors/heroku/img/NewNS35.png" width="600px" />

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

g) Linking your CareLink account as a data source is **not possible anymore using cloud hosted Nightscout sites**.  
Use an Android bridge device with a private version of xDrip+.  
More information **[here](/uploader/xdripcarelink)**.

<img src="/vendors/heroku/img/NewNS36.png" width="500px" />

</br>

j) Select the units you’re using in `DISPLAY_UNITS` acceptable choices are `mg/dl` or `mmol/L` (or just `mmol`).

<img src="/vendors/heroku/img/NewNS37.png" width="500px" />

</br>

h) In `ENABLE`, copy and paste the following words (separated by a space) so that won't have to think about which you want now:

`careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors`

**If you are using your Dexcom share account as a data source** also add `bridge` at the end, after a space like this:

`careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors bridge`

<img src="/vendors/heroku/img/NewNS38.png" width="500px" />

```{admonition} ENABLE words
You find more information about the `ENABLE` words on the: [Setup page](/nightscout/setup_variables)
```

</br>

i) Now you need the connection string you defined during the database creation (as the example below, but not the string below). Copy and paste it in the `MONGODB_URI` variable field.

<img src="/vendors/heroku/img/NewNS39.png" width="500px" />

Make sure it looks like this one below and **NOTE: THERE ARE NO < AND > CHARACTERS**:

Example for MongoDB Atlas:

`mongodb+srv://nightscout:soo5ecret@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority`

Example for a MongoDB database:

`mongodb://nightscout:soo5ecret@mydbhosting.fqd/mydatabase`

</br>

j) Scroll down to the end of the list and click `Deploy app`

<img src="/vendors/heroku/img/NewNS40.png" width="500px" />

</br>

k) **WAIT** until completion (will take some time). Do not interrupt the process until it's complete.

<img src="/vendors/heroku/img/NewNS41.png" width="500px" />

</br>

l) Then click `View` (if nothing happens, click `Manage App` -> `Open App`, in upper right corner)

<img src="/vendors/heroku/img/NewNS42.png" width="500px" />

</br>

```{include} /nightscout/first_setup.md

```

</br>

### Papertrail

- Finally, you might want to modify the `PAPERTRAIL_API_TOKEN` line. Heroku offers a free, tiny amount of Papertrail service (this is like a logging service for how the site is running), but this generates a lot of confusion to most people later on, when they get a message that their "Free Papertrail Service has run out of room". Papertrail is not needed, edit the line and add `DISABLED` at the end, so that you can recover the function if you need it later.

<img src="/vendors/heroku/img/NewNS49.png" width="600px" />

</br></br>

## Editing Config Vars in Heroku

</br>

Once Nightscout deployed, you can access your variables from [Heroku](https://id.heroku.com/login) in order to change or customize your site.
Variables are described [here](/nightscout/setup_variables).



- Select your app

<img src="/vendors/heroku/img/SetupNS00.png" width="800px" />

</br>

- Click `Settings`

<img src="/vendors/heroku/img/SetupNS01.png" width="800px" />

</br>

- Scroll down and click `Reveal Config Vars`

<img src="/vendors/heroku/img/SetupNS02.png" width="800px" />

</br>

- You can modify the values clicking on the pen icon

<img src="/vendors/heroku/img/SetupNS03.png" width="800px" />

</br>

- Change the contents of `Value`  as needed then click `Save Changes`

<img src="/vendors/heroku/img/SetupNS04.png" width="400px" />

</br>

Changing a variable and saving a new value will restart your site, if the change is not actuated you might also want to [restart all dynos](/troubleshoot/heroku.md#restart-all-dynos).

</br>

</br>

## Prevent your Nightscout app from falling asleep

```{admonition} Use with caution
:class: warning
If an app fails and crashes at startup (database full), if you entered wrong credentials and the app stops for missing data activity, using this trick to keep it alive will not help. It might even make things worse in the case of wrong Dexcom credentials and lead to a locked account.
```

This is necessary if you don't have an uploader sending data to Nightscout, or a follower polling data from it.  
For example using the bridge plugin.

- You can use monitoring webapps like Uptime Robot, New Relic, ...

</br>

------

You have completed a new Nightscout site creation. The following section provides more information for variables edition that you might not need to use now.

------

</br>

## Renaming your Nightscout site

```{warning}
Starting June 14th 2023, site names will include an [application name identifier](https://devcenter.heroku.com/articles/custom-domains) after your app name.</br>
Keep this in mind if you want to rename your site: the result might not be as simple as it was before.
```

You can rename your Nightscout site URL in your app `Settings`.

<img src="/vendors/heroku/img/Security01.png" width="600px" />

Once done, make sure all apps (uploaders and downloaders) are updated accordingly.
