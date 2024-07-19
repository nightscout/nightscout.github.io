# Nightscout in Northflank

</br>

```{admonition} Too complicated? Not what you're looking for?
:class: seealso
Consider a hosted Nightscout service! Check for easier solutions [here](/index.md#nightscout-as-a-service).
```

</br>

```{card}
## Northflank
![](/vendors/img/Northflank.png)
^^^
You can create your new Northflank Nightscout site with a [MongoDB Atlas](/vendors/mongodb/atlas) database or with its own [Northflank database](/vendors/northflank/database).

**Pros**:  
* Nightscout fits in the free tier  
* Easy to deploy or migrate an existing site from Heroku  
* Simple to use and troubleshoot  
* Can use a native Northflank MongoDB database
* You can deploy up to $20/mo worth of free resources on Northflank’s managed cloud

**Cons**:  
* The Nightscout address generated for your site is virtually impossible to remember
```

</br>

## Set up a new Nightscout

### Create your Northflank and GitHub accounts from a computer.

```{note}
Do not change device/computer/browser during the setup process!  
If you have unexpected issues when creating your site, restart with another browser.
```

</br>

### Step 0: Create a database

```{note}
Make sure you [created one](/nightscout/database) before starting your Nightscout web app creation with Northflank.
Come back here when you have a MONGODB_URI connection string.
```



```{admonition} Migrating?
:class: tip
Copy the connection string from your previous platform: [edit the variables](/nightscout/setup_variables.md#nightscout-configuration) and look for `MONGODB_URI`.
If you don't see `MONGODB_URI` but see `MONGO_CONNECTION` (**NOT** `MONGO_COLLECTION`): use its value.
```

</br>

### Step 1: Create a GitHub account and fork the Nightscout project

```{tab-set}

:::{tab-item} This is not necessary anymore (with a Docker image)
Continue with Step 2.
:::

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

### Step 2: Create a Northflank account

***If you already created your database in Northflank, skip to step 3.***

a) Sign-up to [Northflank](https://app.northflank.com/signup) in a new browser tab. Login with GitHub (click on the logo).

<img src="/vendors/northflank/img/Northflank00.png" width="400px" />

</br>

b) Confirm your GitHub account if required.

<img src="/vendors/northflank/img/Northflank01.png" width="400px" />

</br>

c) Select `Only select repositories`, in the drop-down list select `cgm-remote-monitor` then click `Install & Authorize`.

<img src="/vendors/northflank/img/Northflank02.png" width="400px" />

</br>

c) Enter a user name, your email address and invent a password (type it twice to confirm). Accept the TOS and Privacy Policy then click  `Continue `.

<img src="/vendors/northflank/img/Northflank03.png" width="600px" />

</br>

d) Click `Choose theme`.

<img src="/vendors/northflank/img/Northflank04.png" width="600px" />

</br>

e) Select `Skip for now`.

<img src="/vendors/northflank/img/Northflank05.png" width="600px" />

</br>

f) Select `Create free project`.

<img src="/vendors/northflank/img/Northflank06.png" width="200px" />

</br>

g) Enter a project name (for example nightscout) and select a region (you can make it geographically close to where you live) then click `Create project`.

<img src="/vendors/northflank/img/Northflank07.png" width="600px" />

</br>

### Step 3: Deploy Nightscout in Northflank

**What are you trying to do now?**

```{tab-set}

:::{tab-item} I want to create a brand new Nightscout from a Docker image (recommended)
:::{include} new_user_d.md
:::


:::{tab-item} I want to create a brand new Nightscout (old method)
:::{include} new_user_a.md
:::

:::{tab-item} I want to migrate from Heroku
:::{include} migrate_a.md
:::

```

To open your Nightscout site, navigate to your project `Services` and click the address link top right.

<img src="/vendors/northflank/img/Northflank29.png" width="600px" />

</br>

**Good time to check you selected the right plan.**

Make sure you selected the developer sandbox plan to avoid unexpected fees.

<img src="/vendors/northflank/img/NorthflankSP.png" width="400px" />

</br>

```{include} /nightscout/first_setup.md

```

</br>

</br>

## Change your Northflank Nightscout site name

You [cannot](https://northflank.com/docs/v1/application/network/configure-ports#public-ports) override the default name if you don't have a DNS.  
You can use [TinyURL](https://tinyurl.com/) to get a shorter name.

<img src="/vendors/northflank/img/TinyURL.png" width="300px" />

You can also use a free [dynamic DNS](/nightscout/dns) service to do this in order to have something easier to remember.

Keep the original Northflank URL in your [uploaders](/uploader/setup/) and [followers](/nightscout/downloaders/).

</br>

------

You have completed a new Nightscout site creation. The following section provides more information for variables edition that you might not need to use now.

------

</br>

## Editing Variables in Northflank 

</br>

a) Open [Northflank](https://app.northflank.com/login) and login with your username or with GitHub.

<img src="/vendors/northflank/img/Northflank30.png" width="400px" />

</br>

b) Select `Services ` then your Nightscout project.

<img src="/vendors/northflank/img/Northflank31.png" width="600px" />

</br>

c) Select `Environment` then `Edit`.

<img src="/vendors/northflank/img/Northflank25.png" width="600px" />

</br>

e) You can perform various operations on your variables:

1. Add a new variable with `+ Add Variable`
2. Edit variables values directly in the table
3. Delete a variable with the bin icon

~~~{note}
Multiple lines values should be typed with `\n` separating each original line.</br>
Example:</br>
<img src="/nightscout/img/APNKeys.png" width="600px" /></br>
```
----BEGIN PRIVATE KEY-----\n
MIGTAgEAMBMGBygGSM49AwEHBHkwdwIBAQQg7c8w00t5ju7N980rerN8N+isnJoec+ohIEuD0teRbPmgCgYIKoZIzj0DAQehRANCAAREnRISLSiFgdn4Lbf44yIKspXKr7GpPBVshv3ShOms2qHTdAFriXXRPmbq7eAJuFrxpYOduU1dl9voouciW0je
\n-----END PRIVATE KEY-----
```
~~~

Don't forget to `Update & restart` when you're done editing.

</br>

## Copy all variables from Heroku 

</br>

a) Export all your Heroku variables as explained [here](/troubleshoot/heroku.md/#method-2-export). In a file you can call `heroku.env`.

If you're currently deploying a new Northflank Nightscout site, select `Env`.

<img src="/vendors/northflank/img/Northflank36.png" width="600px" />

Continue to **c)** below.

</br>

b) If you want to modify an existing Northflank site, 

Open [Northflank](https://app.northflank.com/login) and login with your username or with GitHub.

<img src="/vendors/northflank/img/Northflank30.png" width="400px" />

</br>

Select `Services ` then your Nightscout project.

<img src="/vendors/northflank/img/Northflank31.png" width="600px" />

</br>

Select `Environment` then `Env`.

<img src="/vendors/northflank/img/Northflank39.png" width="600px" />

</br>

c) Select `Import from file` then the file (`heroku.env`) you saved in **a)**.

<img src="/vendors/northflank/img/Northflank37.png" width="600px" />

Your variables should display like this:

<img src="/vendors/northflank/img/Northflank38.png" width="600px" />

</br>

d) If you're creating a new site, return to the step you were following before importing all variables from Heroku.

</br>

e) If you were importing all variables from a running Northflank Nightscout site, select `Update & restart`.

<img src="/vendors/northflank/img/Northflank40.png" width="600px" />