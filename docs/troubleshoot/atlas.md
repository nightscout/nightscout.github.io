# Troubleshoot MongoDB Atlas

</br>

## Limit of one free cluster.

When creating a new site or migrating (usually not the first attempt), when reaching `Target Cluster`.

<img src="/vendors/mongodb/img/TShoot17.png" width="800px" >

- Click the leaf top left in your Atlas account. Look at the `Project Name` you wanted to use when creating your new cluster, it shouldn't contain a cluster yet (like the example below, I tried to create a new Nightscout site but there is already a cluster inside the project I wanted to use). You can't have two clusters in a free project. Click your `Project Name`.
- This should not happen in normal conditions. Before deleting a cluster, check it doesn't contain your data!

<img src="/vendors/mongodb/img/TShoot18.png" width="800px" >

- Click on `Collections` in the cluster you selected.

<img src="/vendors/mongodb/img/TShoot19.png" width="300px" >

- Click on `entries`

<img src="/vendors/mongodb/img/TShoot20.png" width="300px" >

- In the case there is data, like in the example below, **don't use this cluster**. Leave it like this and create a new one.

<img src="/vendors/mongodb/img/TShoot21.png" width="800px" >

- **If there no data**, you can safely delete it.

<img src="/vendors/mongodb/img/TShoot22.png" width="400px" >

- In this cluster you want to delete click `...` then `Terminate`

<img src="/vendors/mongodb/img/TShoot23.png" width="500px" >

- Copy the cluster name to confirm then click `Terminate`

<img src="/vendors/mongodb/img/TShoot24.png" width="600px" >

- Wait until the operation completes.
- You can now use this project name to create a new site.

</br>

## Meet your connection string

For technical details look [here](https://docs.mongodb.com/manual/reference/connection-string/#mongodb-uri).

A typical mLab migrated string will look like this:

`mongodb+srv://heroku_0v50k8rf:ddfsjcpfu8fcoj9n6dueabfd5u@cluster0.g03wh.mongodb.net/  `
`heroku_0v50k8rf?retryWrites=true&w=majority`

A typical new string created with Atlas will look like this:

`mongodb+srv://johndoe:V3ry53cr3t@cluster0.a01bc.mongodb.net/myCGMiC?retryWrites=true&w=majority`

- It will start by `mongodb+srv://` with `mongodb` a **standard prefix** for a connection string, and `+srv` adding a security layer.

- After `://` you'll find your **database username**, that is not your Atlas account username. In the examples above `heroku_0v50k8rf` or `johndoe`.

- Following the username, a separator `:` and your **database password** that is not your Atlas account password. In the examples above a typical 26 characters password created automatically with the mLab add-on `ddfsjcpfu8fcoj9n6dueabfd5u` and a user created password `V3ry53cr3t`.

- Following the password, a separator `@` then the **host name** that was provided by Atlas after you created you cluster. typically it will look like `cluster0.`*`a1b2c3`*`.mongodb.net`

- [Optional] After the host name and the separator `/` you'll see your Nightscout **database name**. If you migrated from mLab it will be identical to your database username (unless you modified it). If you created your Atlas cluster it will be the one you decided. In the examples above `heroku_0v50k8rf` or `myCGMiC`.

- Another separator `?` and you'll see two options: `retryWrites=true&w=majority` 

</br>

## Unable to connect to Mongo

<img src="/vendors/mongodb/img/TShoot54.png" width="800px" >

Common reasons:

- The database is not available. If you don't have a database yet, create a new one.  
  If you do have a database, check it's functional then restart your web app:

```{tab-set}

:::{tab-item} Heroku
[Restart all dynos](/troubleshoot/heroku.md#restart-all-dynos)
:::

:::{tab-item} Railway
[Restart your web app](/troubleshoot/railway.md#restart-your-app)
:::

:::{tab-item} Azure
[Restart app](/troubleshoot/azure.md#restart-app)
:::

:::{tab-item} Northflank
[Restart](/troubleshoot/northflank.md#restart)
:::

:::{tab-item} Fly.io
[Restart your app](/troubleshoot/fly.io.md#restart-your-app)
:::

:::{tab-item} Render
[Restart service](/troubleshoot/render.md#restart-service)
:::

```

- Your Atlas connection string is incorrect. Check [here](#bad-connection-string).

### MongoDB paused

- If you haven't been using Nightscout for a while but it was working before, check the database didn't go to sleep mode. If it did, select `Resume` to restart it.
- Once done:

```{tab-set}

:::{tab-item} Heroku
[Restart all dynos](/troubleshoot/heroku.md#restart-all-dynos)
:::

:::{tab-item} Railway
[Restart your web app](/troubleshoot/railway.md#restart-your-app)
:::

:::{tab-item} Azure
[Restart app](/troubleshoot/azure.md#restart-app)
:::

:::{tab-item} Northflank
[Restart](/troubleshoot/northflank.md#restart)
:::

:::{tab-item} Fly.io
[Restart your app](/troubleshoot/fly.io.md#restart-your-app)
:::

:::{tab-item} Render
[Restart service](/troubleshoot/render.md#restart-service)
:::

```

<img src="/vendors/mongodb/img/TShoot53.png" width="800px" >

</br>

If you see this message

<img src="/vendors/mongodb/img/TShoot06.png" width="800px" >

- [Update to latest version](/vendors/github/update/) and come back after you have a more accurate error message.

</br>

## MongoDB in read only mode

If you see this message:

<img src="/vendors/mongodb/img/TShoot44.png" width="800px" >

- Verify your database is not read only, else click `Edit`

<img src="/vendors/mongodb/img/TShoot15.png" width="800px" >

- Change the permissions to `Atlas Admin` and `Update User`

<img src="/vendors/mongodb/img/TShoot16.png" width="800px" >

- Once done:

```{tab-set}

:::{tab-item} Heroku
[Restart all dynos](/troubleshoot/heroku.md#restart-all-dynos)
:::

:::{tab-item} Railway
[Restart your web app](/troubleshoot/railway.md#restart-your-app)
:::

:::{tab-item} Azure
[Restart app](/troubleshoot/azure.md#restart-app)
:::

:::{tab-item} Northflank
[Restart](/troubleshoot/northflank.md#restart)
:::

:::{tab-item} Fly.io
[Restart your app](/troubleshoot/fly.io.md#restart-your-app)
:::

:::{tab-item} Render
[Restart service](/troubleshoot/render.md#restart-service)
:::

```

</br>

## `MONGODB_URI` missing

If you see this message:

<img src="/vendors/mongodb/img/TShoot45.png" width="800px" >

-  If you don't have a database yet, create a new one.
-  It might be a transient error in MongoDB Atlas, try to restartyour web app:

```{tab-set}

:::{tab-item} Heroku
[Restart all dynos](/troubleshoot/heroku.md#restart-all-dynos)
:::

:::{tab-item} Railway
[Restart your web app](/troubleshoot/railway.md#restart-your-app)
:::

:::{tab-item} Azure
[Restart app](/troubleshoot/azure.md#restart-app)
:::

:::{tab-item} Northflank
[Restart](/troubleshoot/northflank.md#restart)
:::

:::{tab-item} Fly.io
[Restart your app](/troubleshoot/fly.io.md#restart-your-app)
:::

:::{tab-item} Render
[Restart service](/troubleshoot/render.md#restart-service)
:::

```

-  Check your [database is not full](#database-full)!
-  If your Nightscout was still functional after November 11th 2020, continue [below](#bad-connection-string) to recover:

</br>

## Generic Unable to connect to Mongo

If you see this message:

<img src="/vendors/mongodb/img/TShoot47.png" width="800px" >

- Check you authorized all IPs to access your Atlas database:
- Open your Atlas cluster and select your Nightscout project, then `Network access`

<img src="/vendors/mongodb/img/TShoot48.png" width="800px" >

- If you see an IP (in red above) instead of 0.0.0.0/0 click `Edit` select `ALLOW ACCESS FROM ANYWHERE` then `Confirm`.

<img src="/vendors/mongodb/img/TShoot49.png" width="600px" >

- Once done:

```{tab-set}

:::{tab-item} Heroku
[Restart all dynos](/troubleshoot/heroku.md#restart-all-dynos)
:::

:::{tab-item} Railway
[Restart your web app](/troubleshoot/railway.md#restart-your-app)
:::

:::{tab-item} Azure
[Restart app](/troubleshoot/azure.md#restart-app)
:::

:::{tab-item} Northflank
[Restart](/troubleshoot/northflank.md#restart)
:::

:::{tab-item} Fly.io
[Restart your app](/troubleshoot/fly.io.md#restart-your-app)
:::

:::{tab-item} Render
[Restart service](/troubleshoot/render.md#restart-service)
:::

```

</br>

## Bad connection string

If you see this message:

<img src="/vendors/mongodb/img/TShoot46.png" width="800px" >

</br>

- [Edit your Nightscout configuration](/nightscout/setup_variables) and search for a variable called `MONGODB_URI` or `MONGO_CONNECTION`. 

- If you find none, go [here](#recover-your-connection-string).

```{admonition} MONGODB_URI or MONGO_CONNECTION
:class: warning
There should be at least one and only one of them, not both.
```

If you migrated from mLab Heroku add-on it is usually `MONGO_CONNECTION`

if you deployed a brand new Nightscout it should be `MONGODB_URI`

- Verify it is looking like this: 

`mongodb+srv://atlasusername:atlaspassword@cluster0.zzzzz.mongodb.net/dbname?retryWrites=true&w=majority`

Note that your `atlasusername`, `atlaspassword` and `dbname` will be different from the example above.

- Paste the string in the box below:

<input type="text" id="myAtlas" value="Yes here. Delete this and paste it here" size="100">
</br>

- Click the `Analyze` text below:

<button onclick="Analyze()">-> Analyze</button>

<p style="font-size:20px" id="result">Analysis result will appear here.</p>

If the analysis result doesn't show any error, check below the data is what you actually wanted:

**Database Username:** <p id="myUser">...</p>
**Database Password:** <p id="myPwd">...</p>
**Database name:** <p id="mydB">...</p> (No database name is not an error)

<script>
var sUser, sdB, sPwd;
function Analyze()
{


  var sString = "Your connection string structure looks good.";
  var bErr = 0;

  var sAtlas = document.getElementById("myAtlas").value;

  var iAS = sAtlas.search(" ");
  if(iAS!=-1)
  { 
    sString = "There should be no space characters in the string. Remove all spaces";
    bErr = 1;
  }

  iAS = sAtlas.search("mongodb://");
  if(iAS!=-1 && !bErr)
  { 
    sString = "This is not an Atlas connection string: it should start with mongodb+srv://";
    bErr = 1;
  }

  iAS = sAtlas.search("<password>");
  if(iAS!=-1 && !bErr)
  { 
    sString = "You should replace &lt;password&gt; with your actual Atlas database password in the Atlas string";
    bErr = 1;
  }

  iAS = sAtlas.search("<dbname>");
  if(iAS!=-1 && !bErr)
  { 
    sString = "You should replace &lt;dbname&gt; with your actual Atlas database name in the Atlas string";
    bErr = 1;
  }

  iAS = sAtlas.search("<");
  if(iAS!=-1 && !bErr)
  { 
    sString = "There should be no &lt; characters in the Atlas string";
    bErr = 1;
  }

  iAS = sAtlas.search(">");
  if(iAS!=-1 && !bErr)
  { 
    sString = "There should be no &gt; characters in the Atlas string";
    bErr = 1;
  }

  iAS = sAtlas.search("retryWrites=true");
  if(iAS==-1 && !bErr)
  { 
    sString = "Your Atlas string should end with ?retryWrites=true&w=majority";
    bErr = 1;
  }

  var iUsr, iAt, iCol, idB, iQM;

  iUsr = sAtlas.search("://");
  if(iUsr==-1 && !bErr)
  { 
    sString = "Your Atlas string should start by mongodb+srv://";
    bErr = 1;
  }
  else
  {
    iUsr = iUsr + 3;
    sAtlas = sAtlas.substr(iUsr);
  }

  iAt = sAtlas.search("@");
  if(iAt==-1 && !bErr)
  { 
    sString = "Your Atlas string should contain @ after your password";
    bErr = 1;
  };

  iCol = sAtlas.search(":");
  if(iCol==-1 && !bErr)
  { 
    sString = "Your Atlas user and password should be separated by :";
    bErr = 1;
  };

  iQm = sAtlas.search("\\?");
  if(iQm==-1 && !bErr)
  { 
    sString = "Your Atlas string should end with ?retryWrites=true&w=majority";
    bErr = 1;
  };

  idB = sAtlas.search("net/");
  if(idB==-1 && !bErr)
  { 
    sString = "Your Atlas string should be in the mongodb.net domain";
    bErr = 1;
  } else idB = idB + 4;

  if(!bErr)
  {
    sUser = sAtlas.substring(0, iCol);
    sPwd = sAtlas.substring(iCol + 1, iAt);
    sdB = sAtlas.substring(idB, iQm);
    

    document.getElementById("myUser").innerHTML = sUser;
    document.getElementById("myPwd").innerHTML = sPwd;
    document.getElementById("mydB").innerHTML = sdB;

   }

 document.getElementById("result").innerHTML = sString;
}

</script>

```{hint}
If you migrated from Heroku mLab add-on, your database username and database name should be identical.
```

<img src="/vendors/mongodb/img/TShoot41.png" width="800px" >

</br>

If you've just created a new site, try to use [this help page](/_static/stringhelp.html) to verify or recreate it.

</br>

If you're still in trouble continue below:

</br>

## Recover your connection string

If you've tried several times to deploy or migrate, you might end-up with many useless items in your accounts. At this point, you could benefit doing some cleanup in order to identify the correct Atlas database you want to connect to. Consider [cleanup](#cleanup) before continuing.

</br>

a) Go to your MongDB account. Log in if necessary [https://cloud.mongodb.com/](https://cloud.mongodb.com/)

b) Click `Connect` below your cluster name (in the example below `Cluster0`, but it might have another name)

<img src="/vendors/mongodb/img/TShoot07.png" width="400px" >

</br>

c) Click `Connect your application`

<img src="/vendors/mongodb/img/TShoot09.png" width="600px" >

</br>

d) A new view opens, in  `(2) Add your connection string into your application code` you will find your `MONGODB_URI` or `MONGO_CONNECTION` string.

Click `Copy` then `Close`

<img src="/vendors/mongodb/img/TShoot10.png" width="600px" >

</br>

e) Paste it into a place where you can edit the text (i.e. a Word or a Notepad document).

Edit your string so that you add the database user password after the database user info. You defined them during your MongoDB Atlas database creation, when you reached [step **e)**](/vendors/mongodb/atlas/).

Here’s an example of how the string is built up (`myFirstDatabase` might not show, this is normal):

`mongodb+srv://` `nightscout` `:`**`<password>`**`@cluster0.xxxxx.mongodb.net/`**`myFirstDatabase`**`?retryWrites=true&w=majority`

</br>

f) Edit your string in order to replace `<password>` with your database password.

g) If you don't remember your Atlas database password (which should not be your mongoDB Atlas account password) invent a new one (only letters and numbers).

Your string will now look like this: (do not use the same password as the example). Note there are no remaining `<` and `>`.  
If you don't see a database name like `myFirstDatabase` before the question mark, just ignore it.

`mongodb+srv://nightscout:soo5ecret@cluster0.xxxxx.mongodb.net/myFirstDatabase?retryWrites=true&w=majority`

</br>

h) Copy this resulting string above into your `MONGODB_URI` or `MONGO_CONNECTION` variable. There must be only one of these variables, not both.  

See [here](/nightscout/setup_variables) how to edit your configuration variables.

i) If there is neither one nor the other create a new `MONGODB_URI` variable and paste the string in the value field.

j) If you remembered your password restart your web app, and you should be done.

k) If you changed your password or your Nightscout page still fails to open continue.

</br>

## Change your Atlas database password

- If you changed the password in the string you will need to change it in the database too:

- Click `Database Access`

<img src="/vendors/mongodb/img/TShoot11.png" width="400px" >

</br>

- At the end of the line, click `Edit`

<img src="/vendors/mongodb/img/TShoot08.png" width="800px" >

</br>

- In `Password` click `Edit Password`

```{hint}
*Take a look at the top of this view, after `Edit User` you can see your database user name before `@`. Check it's matching the one in your connection string.* 
```

<img src="/vendors/mongodb/img/TShoot12.png" width="600px" >

</br>

- If you forgot your password invent a new one (use only letters and numbers: no special characters) or better: use `Autogenerate Secure Password` and click `Copy`
- Else make it the same than the one in your `MONGODB_URI` connection string variable

<img src="/vendors/mongodb/img/TShoot13.png" width="600px" >

</br>

- Click `Update User`

<img src="/vendors/mongodb/img/TShoot14.png" width="600px" >

</br>

- Make sure the password matches in your connection string variable `MONGODB_URI` or `MONGO_CONNECTION`

</br>

## Database full

Free databases like M0 Sandbox provided by Atlas will only hold a limited amount of data (512MB) and you will eventually need to manually cleanup. You can extend the capacity to 2 and 5GB paying for an M2 or M5 Shared cluster.

**Note:** *If you consider paying for a database upgrade, also think about a [paid hosting service](/index.md#nightscout-as-a-service).*

```{warning}
Make sure your Nightscout site has `Database Size` enabled to monitor database capacity.</br>
In order to have the database size pill, add `dbsize` in the `ENABLE` variable.</br>
Look [here](/nightscout/setup_variables.md#dbsize-database-size) for more information on this plugin.
```

<img src="/vendors/mongodb/img/TShoot35.png" width="600px" >

</br>

```{hint}
Your database size might not decrease immediately (it might even increase temporarily) after you perform cleanup with Admin Tools (see below: Normal cleanup). Allow a few hours to see the effects. In the meantime your site should recover functionality.</br>If your site keeps crashing, go ahead to emergency cleanup.
```

</br>

### Restart

**Try to recover temporary access to Nightscout to perform normal cleanup:**

```{tab-set}

:::{tab-item} Select your platform ->
</br>
:::

:::{tab-item} Heroku
[Restart all dynos](/troubleshoot/heroku.md#restart-all-dynos)
:::

:::{tab-item} Railway
[Restart your web app](/troubleshoot/railway.md#restart-your-app)
:::

:::{tab-item} Azure
[Restart app](/troubleshoot/azure.md#restart-app)
:::

:::{tab-item} Northflank
[Restart](/troubleshoot/northflank.md#restart)
:::

:::{tab-item} Fly.io
[Restart your app](/troubleshoot/fly.io.md#restart-your-app)
:::

:::{tab-item} Render
[Restart service](/troubleshoot/render.md#restart-service)
:::

:::{tab-item} Google Cloud
The probability your database is full is very low, make sure you selected the maximum disk size for your compute engine. See [Here](https://navid200.github.io/xDrip/docs/Nightscout/FullDisk.html). 
:::

:::{tab-item} Hosted services
Contact your provider. The probability your database is full is virtually null.
:::

```

### Normal cleanup

You can cleanup (enter the number of days to keep) or delete your devices status (recommended as a first recovery action):

<img src="/vendors/mongodb/img/TShoot37.png" width="800px" >

Same for `Treatments`:

<img src="/vendors/mongodb/img/TShoot38.png" width="800px" >

And `Glucose entries`. If you are reluctant to lose historical data you should consider opting for a paid database solution or [hosted](/index.md#nightscout-as-a-service) Nightscout.

<img src="/vendors/mongodb/img/TShoot39.png" width="800px" >

If your Nightscout page doesn't open after restarting your app and you want to rule out a full database, you can try an emergency cleanup of the less important part of your Nightscout site: `devicestatus`.

</br>

### Emergency cleanup

- Log in [Atlas](https://account.mongodb.com/account/login)
- Open your Nightscout database and select `Browse collections` in `Database`

<img src="/vendors/mongodb/img/TShoot32.png" width="800px" >

- Select the `devicestatus` collection and click the bin icon to delete it.  

- You will lose all device status history (battery, ..) but **you won't lose neither BG, treatments nor profiles**.

<img src="/vendors/mongodb/img/TShoot55.png" width="300px" >

- Write `devicestatus` in the box then click `Drop`


<img src="/vendors/mongodb/img/TShoot56.png" width="300px" >

- [Restart](#restart) your site and when it opens, consider again [cleanup](#normal-cleanup) from Admin Tools if your database size exceeds 80%.

</br>

### Atlas database size verification

- Log in [Atlas](https://account.mongodb.com/account/login)
- Open your Nightscout database and select `Collections`

<img src="/vendors/mongodb/img/TShoot32.png" width="800px" >

</br>

- Click your database name (hidden left). Check the`DATABASE SIZE` is indeed close to or at the limit (512MB) then look at these three collections `Documents size`: `devicestatus`, `entries` and `treatments`.

<img src="/vendors/mongodb/img/TShoot36.png" width="800px" >

- Open Nightscout  [`Admin tools`](/nightscout/discover.md#drawer-menu). If your site doesn't open jump to [Emergency cleanup](#emergency-cleanup).
- Depending on the collection you identified above, choose which of the following you want to cleanup.

</br>

## Reports slow loading or timeout

Loopers might experience Nightscout taking an extremely long time or even timing out when creating reports due to the profiles collection database growing too big.

Two solutions are available:

1. Follow this video (set it full screen in 720p) to selectively delete profiles [https://www.youtube.com/watch?v=iipp0MfPKNQ](https://www.youtube.com/watch?v=iipp0MfPKNQ)
2. Delete all profiles in Atlas

Log in to Atlas [https://account.mongodb.com/account/login](https://account.mongodb.com/account/login)

Select your cluster then `COLLECTIONS`

<img src="/vendors/mongodb/img/TShoot50.png" width="800px" >

</br>

Select the `profile` collection and click the bin icon to delete all profiles.

<img src="/vendors/mongodb/img/TShoot51.png" width="300px" >

</br>

Write `profile` in the box then click `Drop`

<img src="/vendors/mongodb/img/TShoot52.png" width="400px" >

</br>

Open your Nightscout and create a new profile (mind the time zone!), authenticate and save it.

If you are using Loop, temporarily change a basal rate in Loop, and confirm your profiles now show up in Nightscout.

</br>

## Data in the future

First try to [remove future items with the Admin Tools](/nightscout/admin_tools.md#remove-future-items-from-database).

If it doesn't give the expected result:

- Check in [Atlas](https://account.mongodb.com/account/login)

- Open your Nightscout cluster and select `Collections`

<img src="/vendors/mongodb/img/TShoot32.png" width="800px" >

</br>

- In `Entries` type `{date:-1}` and click `Find`

<img src="/vendors/mongodb/img/TShoot33.png" width="800px" >

</br>

- Delete the entries in the future (manually) with the bin icon

<img src="/vendors/mongodb/img/TShoot34.png" width="500px" >

</br>

## Cleanup

It is very easy to get lost in Atlas.

The structure from top to bottom is: Organization, Projects and Databases. You can have several organizations, each of them several projects and each of them several databases.

```{hint}
If you are deploying a brand new Nightscout make sure you have one organization, one project and one cluster created. No more no less.
```

If you want to cleanup Atlas, unless you don't have data, you must first find out which database contains your data. For this, start from `View All Organizations`:

<img src="/vendors/mongodb/img/Cleanup03.png" width="400px" >

You can delete empty organizations (those without any project inside).

<img src="/vendors/mongodb/img/Cleanup04.png" width="800px" >

Select the organization, then top left the cog wheel to go in `Settings`, then scroll down to `Delete Organization`: `Delete`.

<img src="/vendors/mongodb/img/Cleanup06.png" width="800px" >

Deleting an organization without projects will not delete your data. 

<img src="/vendors/mongodb/img/Cleanup05.png" width="600px" >

------

Once inside an organization, you will see its projects. You can safely delete projects without clusters.

<img src="/vendors/mongodb/img/Cleanup07.png" width="800px" >

Deleting an empty project doesn't delete your Nightscout data.

<img src="/vendors/mongodb/img/Cleanup08.png" width="600px" >

For non-empty projects continue reading before deciding to delete them.

------

You can then move to your project (select it) and check its database(s) selecting `COLLECTIONS`

<img src="/vendors/mongodb/img/Cleanup09.png" width="800px" >

An empty project will look like below, and this is typically what you have before deploying Nightscout. Once Nightscout is deployed in a project, a new database will be created there.

<img src="/vendors/mongodb/img/Cleanup10.png" width="400px" >

The database currently used by your Nightscout is the one specified in the connection string, in the example below `dbname`. Whenever you change the database name in the connection string, a new database will be created in your project.

`mongodb+srv://atlasusername:atlaspassword@cluster0.zzzzz.mongodb.net/`**`dbname`**`?retryWrites=true&w=majority`

There is usually one database for Nightscout, if there are several, select one and then the other(s) to understand which one contains your data. For this, select `entries`.

<img src="/vendors/mongodb/img/Cleanup11.png" width="800px" >

A large database is most probably one you want to keep.

<img src="/vendors/mongodb/img/Cleanup12.png" width="600px" >

You can safely delete empty databases (check the size first).

<img src="/vendors/mongodb/img/Cleanup13.png" width="600px" >

```{warning}
If you're not sure you're deleting the right database, just leave it.
```

Hover on the database name and click the bin icon. Confirm deletion by copying the database name and click `Drop`.

<img src="/vendors/mongodb/img/Cleanup14.png" width="700px" >

If your database gets recreated after you deleted it this means your `MONGODB_URI` or `MONGO_CONNECTION` string is pointing to it.

</br>

<span style="font-size:larger;">If you want to delete a non-empty Project you need to terminate all clusters belonging to it.</span></span>

<img src="/vendors/mongodb/img/Cleanup15.png" width="700px" >

```{warning}
Terminating a cluster will delete all information and databases in this cluster!
```

Confirm with your cluster name and wait until shutdown is complete.

<img src="/vendors/mongodb/img/Cleanup16.png" width="600px" >

You can then delete the empty project.

</br>

## Backup your database

```{admonition} Not a normal operation
:class: warning
Making a backup of your database is either a good idea or necessary if you want to migrate it to another database.
This is not an easy operation and requires command line instructions using a computer.
```

### Install the database tools

Follow [this link](https://www.mongodb.com/docs/database-tools/installation/installation/) to install the CLI tool on your computer.

### Dump your database

Get your `MONGODB_URI` handy to find the missing pieces (password and database name).

Log in your MongoDB account [https://cloud.mongodb.com/](https://cloud.mongodb.com/).

1. Select your organization
2. Select your database
3. In the advanced options menu, select `Command line tools`

<img src="/vendors/mongodb/img/AtlasX01.png" width="800px" />

</br>

Scroll down to `Binary import and Export tools`, copy the `mongodump` command line.

<img src="/vendors/mongodb/img/AtlasX02.png" width="700px" />

Paste the command line in a text editor.

Look into your `MONGODB_URI` and replace `<PASSWORD>` with your database password and entually (if you have one) `<DATABASE>` with your database name.

<img src="/vendors/mongodb/img/AtlasX03.png" width="1000px" />

</br>

Open a command line utility (CMD, Terminal, ...) and make your way to the utility folder (if you don't want to include it in your system path).  
For example in Windows 64bits it's in `C:\Program Files\MongoDB\Tools\100\bin`.

Copy and paste your `mongodump` command, run it.

<img src="/vendors/mongodb/img/AtlasX04.png" width="800px" />

</br>

You will find the database dump in a subfolder called `dump` with your database name in a subfolder.

<img src="/vendors/mongodb/img/AtlasX07.png" width="600px" />

</br>