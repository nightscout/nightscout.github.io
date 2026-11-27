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

## Step 2: Create a Render account

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

## Step 3 - Deploy Nightscout in Render

Select below how you want to do this:

```{tab-set}

:::{tab-item} Deploy with Docker (recommended)
:::{include} new_user_d.md
:::

:::{tab-item} Using a blueprint
:::{include} new_user_a.md
:::

```

</br>

* From the menu, `Dashboard`, then select your web service.

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

* Log in [Render](https://dashboard.render.com/)

<img src="/vendors/render/img/Render02.png" width="400px" ></br>

* Select your web service

<img src="/vendors/render/img/Render16.png" width="600px" ></br>

* Go to `Environment`, your variables will display

 <img src="/vendors/render/img/Render21.png" width="500px" ></br>

* You can modify variables by making the changes directly in the text boxes.  
  You can also add variables with `Add environment variable`.  
  When you're done, scroll down and `Save changes`.

<img src="/vendors/render/img/Render23.png" width="600px" ></br>

* Wait a few minutes for your site to redeploy. You can track the status in `Events`.

<img src="/vendors/render/img/Render24.png" width="800px" ></br>

</br>
