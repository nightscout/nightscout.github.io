# Nightscout in Railway

</br>

```{admonition} Too complicated? Not what you're looking for?
:class: seealso
Consider a hosted Nightscout service! Check for easier solutions [here](/index.md#nightscout-as-a-service).
```

</br>

```{warning}
The free plan has been removed Jul 3rd for new users and Aug 1st for existing users.
```

</br>

```{card}
## Railway.app
![Railway](/vendors/img/Railway.png)
^^^
You can easily create a new Railway Nightscout site with a [MongoDB Atlas](/vendors/mongodb/atlas) database or a [Railway MongoDB database](/vendors/railway/database).

**Pros**:  
* Nightscout fits in the 5$/month Hobby account
* Easy to deploy or migrate an existing site from Heroku
* Simple to use and troubleshoot
* You can host several Nightscout sites within a single Hobby account
* Can use a native Railway MongoDB database ($)  

**Cons**:
* The railway.app domain is blocked for safety by some companies  
* Railway network model causes issues with some follower app and devices 
```

</br>

## Set up a new Nightscout

### Create your Railway and GitHub accounts from a computer.

```{note}
Do not change device/computer/browser during the setup process!  
If you have unexpected issues when creating your site, restart with another browser.
```

</br>

### Step 0: Create a database

```{note}
Make sure you [created one](/nightscout/database) before starting your Nightscout web app creation with Railway.
Come back here when you have a MONGODB_URI connection string.
```



```{admonition} Migrating?
:class: tip
Copy the connection string from your previous platform: [edit the variables](/nightscout/setup_variables.md#nightscout-configuration) and look for `MONGODB_URI`.
If you don't see `MONGODB_URI` but see `MONGO_CONNECTION` (**NOT** `MONGO_COLLECTION`): use its value.
```

</br>

### Step 1: Fork `cgm-remote-monitor`

**Do you have a GitHub account?**

```{tab-set}

:::{tab-item} This is not necessary anymore (with a Docker image)
Continue with Step 2.
:::

:::{tab-item} I don't have a GitHub Account
::{admonition} Railway.app new security requirement
:class: warning
You cannot connect Railway to GitHub if you just created your account.</br>
Your GitHub account needs to have been created months ago.</br></br>
<img src="/vendors/railway/img/RailwayGitHub.png" width="400px" /></br></br>
**Consider another platform.**</br>
:::

:::{tab-item} I already have a GitHub Account
### Update your Nightscout fork
:::{include} /vendors/github/update_b.md
:::

```

</br>

### Step 2: Create a Railway account

If you already have a Railway account, make sure you have a Hobby plan: go to **step g)**.

</br>

a) Open [Railway](https://railway.app) in a new browser tab and click `login`. Login with GitHub.

<img src="/vendors/railway/img/Railway00.png" width="700px" />

<img src="/vendors/railway/img/Railway01.png" width="400px" />

</br>

b) If the following screen shows-up, select `Authorize Railway App`.

<img src="/vendors/railway/img/Railway02.png" width="400px" />

</br>

c) Click on `Please agree to the new terms to keep on using Railway`.

<img src="/vendors/railway/img/Railway03.png" width="600px" />

</br>

d) Scroll down and click `I agree with Railway's Terms of Service`.

<img src="/vendors/railway/img/Railway04.png" width="500px" />

</br>

e) Scroll down and click `I will not deploy any of that`.

<img src="/vendors/railway/img/Railway05.png" width="500px" />

</br>

```{warning}
The free plan has been removed Jul 3rd for new users and Aug 1st for existing users.
```

</br>

f) You should now see this. You've created your Railway account.  
If it still shows 200 hours, refresh your browser page.

<img src="/vendors/railway/img/Railway06a.png" width="600px" />

</br>

g) Upgrade your account to a Hobby plan. Click on the `Starter Plan` information and select `Remove Resource Limits`.

<img src="/vendors/railway/img/Railway06b.png" width="300px" />

</br>

Enter your credit card information and select `Subscribe to a Hobby Plan`.

<img src="/vendors/railway/img/Railway06c.png" width="600px" />

Your card will be billed 1$ that will be refund immediately. Bank fees won't be refund.

You will be billed 5$ per month.

</br>

### Step 3 - Deploy Nightscout in Railway

Select below how you want to do this:

```{tab-set}

:::{tab-item} Deploy with Docker (recommended)
:::{include} new_user_d.md
:::

:::{tab-item} Using the Railway button
:::{include} new_user_b.md
:::

:::{tab-item} Using the help page
:::{include} new_user_a.md
:::

:::{tab-item} Migrate from Heroku
:::{include} migrate.md
:::

```

</br>

Congratulations. You created your new Nightscout site with Railway.

Click the site name to open Nightscout.

<img src="/vendors/railway/img/RailwayM14.png" width="500px" />

</br>

```{include} /nightscout/first_setup.md

```

</br>

</br>

## Change your Nightscout site name

Railways automatically makes a name when creating your new site. It is rather difficult to remember.

You can change the site name but need to keep the `.up.railway.app` domain.

1. Select your Nightscout app

2. Go in `Settings`

3. In `Domains` (or `Networking` with Docker) go to the end of line and click the edit icon

4. Write your new name and check it's available

   Click `Update`

   Your Nightscout URL will now be `https://`*yoursitename*`.up.railway.app`

<img src="/vendors/railway/img/Railway38.png" width="700px" />

</br>

Change all your [uploaders](/uploader/setup/) and [follower](/nightscout/downloaders/) devices to reflect the new URL once verified correct functioning of your Nightscout site.

</br>

------

You have completed a new Nightscout site creation. The following section provides more information for database migration and variables edition that you might not need to use now.

------

</br>

## Editing Variables in Railway

</br>

### Method 1 - Web interface

This is recommended when you only need to edit or add few variables.

a) Open [Railway](https://railway.app) and click `login`. Login with GitHub.

<img src="/vendors/railway/img/Railway00.png" width="600px" />

<img src="/vendors/railway/img/Railway01.png" width="300px" />

</br>

b) Select your Nightscout project.

<img src="/vendors/railway/img/RailwayM15.png" width="600px" />

</br>

c) Select your web app.

<img src="/vendors/railway/img/RailwayM16.png" width="300px" />

</br>

d) Click on `Variables`.

<img src="/vendors/railway/img/RailwayM17.png" width="400px" />

</br>

e) You can perform various operations on your variables:

1. Add a new variable with `+ New Variable`
2. View the variable value with `Show Value`
3. Edit or delete the variable or its value with the line end menu

<img src="/vendors/railway/img/RailwayM18.png" width="700px" />

</br>

Note that each variable modification will redeploy your project.

</br>

### Method 2 - Raw Editor

This is recommended when you must perform lots of changes to avoid multiple project redeploys.

a) Open [Railway](https://railway.app) and click `login`. Login with GitHub.

<img src="/vendors/railway/img/Railway00.png" width="600px" />

<img src="/vendors/railway/img/Railway01.png" width="300px" />

</br>

b) Select your Nightscout project.

<img src="/vendors/railway/img/RailwayM15.png" width="400px" />

</br>

c) Select your web app.

<img src="/vendors/railway/img/RailwayM16.png" width="300px" />

</br>

d) Click on `Variables`.

<img src="/vendors/railway/img/RailwayM17.png" width="400px" />

</br>

e) Click on `RAW Editor` top right

<img src="/vendors/railway/img/Railway39.png" width="600px" />

</br>

f) You can access all your variables in a text editor, each line contains the variable name, the sign `=` then its corresponding value.

`VARIABLE=value`

Perform all your changes taking care of uppercase and lowercase information and click `Update Variables` when finished.

<img src="/vendors/railway/img/Railway40.png" width="400px" />

</br>

Once saved your project will redeploy.  
If deploy fails, check your modifications...

</br>
