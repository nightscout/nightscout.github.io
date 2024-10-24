# Nightscout in Azure (Docker)

</br>

```{admonition} Too complicated? Not what you're looking for?
:class: seealso
Consider a hosted Nightscout service! Check for easier solutions [here](/index.md#nightscout-as-a-service).
```

</br>

```{card}
## Azure
![Azure](/vendors/img/Azure.png)
^^^
Nightscout DIY was [originally](https://github.com/rnpenguin/cgm-remote-monitor) created with Azure but most users dropped it after costs increased.  
A new deployment method has been created using a Docker container.  

**Pros**:  
* Large platform with a reliable history
* Well known by the community IT specialists
* Using a basic plan and free services keep it free

**Cons**:  
* Trial account lasts maximum 12 months
* Basic plan and pay as you go is free if you stay within quotas
* The F1 free app service plan is designed for testing, not production
* **The Cosmos database doesn't integrate correctly with Nightscout**
```

</br>

This is a transcript of the original video which cannot be used as-is anymore because the **Cosmos (MongDB) database which was used at the time of the video isn't fully compatible with Nightscout and can't be deployed in some geographical areas**. For reference the obsolete video is [here](https://www.youtube.com/watch?v=EDADrteGBnY).

</br>

## Step 0: Create a database

```{note}
Make sure you [created one](/nightscout/database) before starting your Nightscout web app creation with Azure.
Come back here when you have a MONGODB_URI connection string.
```

```{admonition} Migrating?
:class: tip
Copy the connection string from your previous platform: [edit the variables](/nightscout/setup_variables.md#nightscout-configuration) and look for `MONGODB_URI`.
If you don't see `MONGODB_URI` but see `MONGO_CONNECTION` (**NOT** `MONGO_COLLECTION`): use its value.
```

</br>

## Step 1: Create an Azure account

a) Open a web page in [https://azure.microsoft.com/en-us/free/](https://azure.microsoft.com/en-us/free/) and click Start Free.

<img src="/vendors/azure/img/Azure01.png" width="400px" />

</br>

b) Sign in with your Microsoft account if you have one, else use GitHub.

<img src="/vendors/azure/img/Azure02.png" width="400px" />

</br>

c) Agree and click Next.  
Perform necessary authentication.

<img src="/vendors/azure/img/Azure03.png" width="500px" />

</br>

## Step 2: Create your Nightscout web app

a) From the top left ☰ menu or the Azure Services icons, select + Create a resource.

<img src="/vendors/azure/img/Azure05.png" width="400px" />

</br>

b) Search Web app and click Create.

<img src="/vendors/azure/img/Azure22.png" width="400px" />

</br>

c) Check you're still using your Free Trial or 3-Month free Trial.  
Open the list in Resource group and pick your group (the one you created in Step 2.f.).

<img src="/vendors/azure/img/Azure23.png" width="600px" />

If your free trial expired, select Pay-As-You-Go. It will be free if you use free resources like the Free F1 resource (see below).

</br>

d) Decide your site name (only lowercase and you can use `-` as a separator).  
It must be unique: check the tick box at the end of the line is green.  
If it isn't: you need to choose another name...

<img src="/vendors/azure/img/Azure24.png" width="600px" />

</br>

e) Now select a Docker container, in Linux.

Pick a place close to where you live in the Region selection.  
Make sure it is the same than the database region you selected in Step 2.g.

<img src="/vendors/azure/img/Azure25.png" width="600px" />

</br>

f) Select the free F1 plan.

<img src="/vendors/azure/img/Azure26.png" width="600px" />

```{admonition} Limited CPU usage
:class: warning
The Free F1 plan includes 60 CPU minutes per day. It usually is enough for a moderate Nightscout usage but can also be insufficient and provoke interruptions in your Nightscout site. Not recommended for FreeAPS X and OpenAPS users.
If you want a more reliable CPU, consider another plan like Shared D1 ($).
```

</br>

g) Click Next: Database > down in the page.

<img src="/vendors/azure/img/Azure27.png" width="400px" />

</br>

g) Do not change anything and click Next: Docker > down in the page.

<img src="/vendors/azure/img/Azure28.png" width="400px" />

</br>

h) In Image source select **Docker Hub** instead of Quickstart.

<img src="/vendors/azure/img/Azure29.png" width="600px" />

</br>

i) In Image and tag paste the following name:

`nightscout/cgm-remote-monitor:latest`

<img src="/vendors/azure/img/Azure30.png" width="600px" />

</br>

j) Click Review + create in the lower left of the page.

<img src="/vendors/azure/img/Azure12.png" width="300px" />

</br>

k) Verify the summary information:  
Free sku  
Check the site Name is what you wanted  
then click Create.

<img src="/vendors/azure/img/Azure31.png" width="400px" />

</br>

Wait for the deployment to complete. Do not interfere.

<img src="/vendors/azure/img/Azure33.png" width="400px" />

</br>

Congratulations, you have created your Nightscout web app.

</br>

## Step 3: Configure your Nightscout web app

> Now you need to tell it where the database is and other important information

a) Click Go to resource

<img src="/vendors/azure/img/Azure32.png" width="150px" />

</br>

b) In the left menu select Configuration

<img src="/vendors/azure/img/Azure34.png" width="400px" />

</br>  

**Check which deployment you're doing now!:**

```{tab-set}

:::{tab-item} I'm building a new Azure site
:::{include} /vendors/azure/new_user_a.md
:::

:::{tab-item} I'm migrating from another platform
:::{include} /vendors/azure/new_user_b.md
:::

```

j) From the menu select Overview, then Browse.

<img src="/vendors/azure/img/Azure40.png" width="400px" />

It will take some time before the window opens.

</br>

```{include} /nightscout/first_setup.md

```

</br>

## Editing Config Vars in Azure

</br>

a) Log into Azure : [https://portal.azure.com/](https://portal.azure.com/)

b) Select your App service, your Nightscout site name (you should see it in recent resources)

<img src="/vendors/azure/img/Azure42.png" width="500px" />

If you didn't find it, it will show in App Services

<img src="/vendors/azure/img/Azure43.png" width="500px" />

c) In the left menu select Environment variables

<img src="/vendors/azure/img/Azure34.png" width="500px" />

### View a variable value

Click the eye icon to display the hidden value

<img src="/vendors/azure/img/Azure45.png" width="800px" />

### Modify a variable

Identify the line with the variable you want to change and click the pen icon at the end of the line  
Click OK to save it when finished  
Remember to save modifications when done with your variables!

<img src="/vendors/azure/img/Azure44.png" width="800px" />

### Delete a variable

Identify the line with the variable you want to delete and click the bin icon at the end of the line  
Remember to save modifications when done with your variables!

<img src="/vendors/azure/img/Azure46.png" width="800px" />

### Add a variable

Select New Application Setting and type variable name and value  
Remember to save modifications when done with your variables!

<img src="/vendors/azure/img/Azure35.png" width="400px" />

~~~{note}
Multiple lines values with `\n` should be edited manually as the character `\` will be duplicated.</br>
Example: `LOOP_APNS_KEY`</br>
```
----BEGIN PRIVATE KEY-----\nMIGTAgEAMBMGBygGSM49AwEHBHkwdwIBAQQg7c8w00t5ju7N980r\nerN8N+isnJoec+ohIEuD0teRbPmgCgYIKoZIzj0DAQehRANCAAREnRISLSiFgdn4\nLbf44yIKspXKr7GpPBVshv3ShOms2qHTdAFriXXRPmbq7eAJuFrxpYOduU1dl9vo\nouciW0je\n-----END PRIVATE KEY-----
```
~~~

Insert the value like you've done for all the others.

<img src="/vendors/azure/img/Azure48.png" width="600px" />

At the top of the Environment variables view, select Advanced edit.

<img src="/vendors/azure/img/Azure49.png" width="600px" />

Scroll down the list to your variable name and delete all duplicated `\` so that there will be no more `\\n` separators but only `\n`.

<img src="/vendors/azure/img/Azure50.png" width="600px" />

Click `OK` to save the modified variable.

</br>

### Save your modifications

When you're done modifying your variables, click Save (or Discard if you don't want to save).  
Your site will redeploy if you changed the configuration. Expect a few minutes before it comes back online.

<img src="/vendors/azure/img/Azure47.png" width="400px" />
