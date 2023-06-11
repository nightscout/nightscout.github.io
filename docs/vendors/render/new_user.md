---
orphan: true
---

# Nightscout in Render

</br>

```{admonition} Too complicated? Not what you're looking for?
:class: seealso
Consider a hosted Nightscout service! Check for easier solutions [here](/index.md#nightscout-as-a-service).
```

</br>

```{card}
## Render
![Render Free](/vendors/img/Render.png)
^^^
You can create your Nightscout site in Render.

**Pros**:  
* No credit card required

**Cons**:
* The free plan doesn't guarantee any reliability
* App will sleep after 15 minutes
* Render URLs are considered unsafe by some internet providers
* Relying on the MongoDB Atlas database
```

</br>

------


## Step 0: Create a database

```{admonition} Render doesn't include a database
:class: note
Make sure you [created one](/nightscout/database) before starting your Nightscout web app creation with Render.
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
### Fork the Nightscout project
:::{include} /vendors/github/fork.md
:::

:::{tab-item} I already have a GitHub Account
### Update your Nightscout fork
:::{include} /vendors/github/update_b.md
:::

```

</br>

## Step 2: Add the `render.yaml` template

- Sign in your GitHub account: [https://github.com/login](https://github.com/login).

<img src="/vendors/github/img/UpdateNS00.png" width="400px" ></br>

- Select your own `cgm-remote-monitor` project.

<img src="/vendors/github/img/UpdateNS01.png" width="400px" ></br>

1. Open the branches list
2. Type `render`
3. Select Create a branch: render from 'master'

<img src="/vendors/github/img/NewBranch.png" width="400px" ></br>

* Select Add File - Create new file

<img src="/vendors/github/img/AddFile.png" width="600px" ></br>

* Type `render.yaml` for the name. Leave it open like that for now.

<img src="/vendors/render/img/Yaml00.png" width="600px" ></br>

* Open the `render.txt` template from [here](/_static/render.txt) and edit it with a notepad app, **select all**, copy and paste into the GitHub page you have open from above.

 <img src="/vendors/render/img/Yaml01.png" width="600px" ></br>

* Scroll up the page in GitHub and select `Commit changes` top right.

<img src="/vendors/render/img/Yaml02.png" width="800px" ></br>

* Confirm with `Commit changes`.

<img src="/vendors/render/img/Yaml03.png" width="400px" ></br>

* Your cgm-remote-monitor project is ready for Render Blueprints deploy.

</br>

## Step 3: Create a Render account

a) Open a new browser page in [Render](https://render.com/) and select `GET STARTED FOR FREE`

<img src="/vendors/render/img/Render01.png" width="200px" ></br>

b) Sign up with GitHub

<img src="/vendors/render/img/Render02.png" width="300px" ></br>

c) `Authorize Render`

<img src="/vendors/render/img/Render03.png" width="400px" ></br>

d) `COMPLETE SIGN UP` with your GitHub account email

<img src="/vendors/render/img/Render04.png" width="400px" ></br>

e) Check your inbox and click the confirmation link

<img src="/vendors/render/img/Render05.png" width="600px" ></br>

</br>

## Step 4: First deploy in Render

a) Select `Blueprints`

<img src="/vendors/render/img/Render06.png" width="400px" ></br>

b) Then `New blueprint instance`

<img src="/vendors/render/img/Render07.png" width="600px" ></br>

c) `Connect` your `cgm-remote-monitor` project

<img src="/vendors/render/img/Render08.png" width="600px" ></br>

d) Enter a name for your blueprint (anything simple, Nightscout is ok)

<img src="/vendors/render/img/Render09.png" width="400px" ></br>

e) Click the drop down menu of `Branch` (1) then select `render` (2)

<img src="/vendors/render/img/Render10.png" width="400px" ></br>

**You now need to setup core variables for your site:**

<img src="/vendors/render/img/Render11.png" width="600px" ></br>

f) In `MONGODB_URI` paste your database connection string from Step 0 above

g) `API_SECRET` will be your Nightscout site password, it needs to be at least 12 characters long and you should **NOT use spaces** if you use @ or ! symbols remember you will probably need to express them using [Percent encoding](https://en.wikipedia.org/wiki/Percent-encoding#Percent-encoding_reserved_characters) in your uploader and downloader apps. If you're not sure on how to do this, it is recommended to use only letters (uppercase + lowercase) and digits.

```{warning}
The API_SECRET is the **main password allowing full access to your Nightscout site**. Make sure it's reasonably secure (mix uppercase and lowercase letters, plus digits) and **do no not share it publicly**. If you think you exposed it by mistake, it is recommended that you **change it**.
```

h) Define your `DISPLAY_UNITS`   
Acceptable choices for the units used in Nightscout are `mg/dl` or `mmol/L` (or just `mmol`).

</br>

i) Once all three variables have been set, `Apply`

<img src="/vendors/render/img/Render12.png" width="600px" ></br>

j) Your Nightscout site will be deployed. Wait until the operation completes after some minutes.

<img src="/vendors/render/img/Render13.png" width="300px" >

<img src="/vendors/render/img/Render14.png" width="300px" ></br>

Congratulations. You created your new Nightscout site with Render.

The following step is important, don't skip it.

</br>

## Step 5: Delete the `render` branch

```{hint}
In order to deploy your site with a blueprint, you needed to modify your GitHub repository.
Now you want to remove this modification so that you'll be able to update it normally. 
```

- Sign in your GitHub account: [https://github.com/login](https://github.com/login).

<img src="/vendors/github/img/UpdateNS00.png" width="400px" ></br>

- Select your own `cgm-remote-monitor` project.

<img src="/vendors/github/img/UpdateNS01.png" width="400px" ></br>

* Click on branches  to display all.

<img src="/vendors/render/img/Render18.png" width="400px" ></br>

* Locate the `render` branch and click on the bin icon to delete it.

<img src="/vendors/render/img/Render19.png" width="400px" ></br>

You have successfully removed the temporary modification required to deploy a new Render site.

<img src="/vendors/render/img/Render20.png" width="400px" ></br>

* Your Render site will redeploy using the normal `master` branch of `cgm-remote-monitor`, wait a few minutes until the operation completes.

</br>

* From the menu, `Dashboard`, then select your web service (the one you defined in step **4d**).

<img src="/vendors/render/img/Render15.png" width="400px" >

<img src="/vendors/render/img/Render16.png" width="600px" ></br>

* This is your new Nightscout site, click on the URL to open it

<img src="/vendors/render/img/Render17.png" width="400px" ></br>

</br>

```{include} /nightscout/first_setup.md

```

</br>

## Editing Variables in Render

</br>

* Sign in [Render](https://dashboard.render.com/) with GitHub

<img src="/vendors/render/img/Render02.png" width="400px" ></br>

* Select your web service

<img src="/vendors/render/img/Render16.png" width="600px" >

* Go to `Environment`, your variables will display

 <img src="/vendors/render/img/Render21.png" width="500px" >

* You can modify variables by making the changes directly in the text boxes.  
  You can also add variables with `Add environment variable`.  
  When you're done, scroll down and `Save changes`.

<img src="/vendors/render/img/Render23.png" width="600px" >

* Wait a few minutes for your site to redeploy. You can track the status in `Events`.

<img src="/vendors/render/img/Render24.png" width="800px" >

</br>
