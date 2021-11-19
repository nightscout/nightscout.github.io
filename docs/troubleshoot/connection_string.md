# Meet your connection string

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/Atlas.png" style="zoom:80%;" />

For technical details look [here](https://docs.mongodb.com/manual/reference/connection-string/#mongodb-uri).

A typical mLab migrated string will look like this:

`mongodb+srv://heroku_0v50k8rf:ddfsjcpfu8fcoj9n6dueabfd5u@cluster0.g03wh.mongodb.net/heroku_0v50k8rf?retryWrites=true&w=majority`

A typical new string created with Atlas will look like this:

`mongodb+srv://johndoe:V3ry53cr3t@cluster0.a01bc.mongodb.net/myCGMiC?retryWrites=true&w=majority`



- It will start by `mongodb+srv://` with `mongodb` a **standard prefix** for a connection string, and `+srv` adding a security layer.



- After `://` you'll find your **database username**, that is not your Atlas account username. In the examples above `heroku_0v50k8rf` or `johndoe`.



- Following the username, a separator `:` and your **database password** that is not your Atlas account password. In the examples above a typical 26 characters password created automatically with the mLab add-on `ddfsjcpfu8fcoj9n6dueabfd5u` and a user created password `V3ry53cr3t`.



- Following the password, a separator `@` then the **host name** that was provided by Atlas after you created you cluster. typically it will look like `cluster0.`*`a1b2c3`*`.mongodb.net`



- After the host name and the separator `/` you'll see your Nightscout **database name**. If you migrated from mLab it will be identical to your database username (unless you modified it). If you created your Atlas cluster it will be the one you decided. In the examples above `heroku_0v50k8rf` or `myCGMiC`.



- Another separator `?` and you'll see two options: `retryWrites=true&w=majority` 

</br>

## Unable to connect to Mongo

<img src="../img/TShoot54.png" style="zoom:80%;" >

Common reasons:

- The database Heroku is pointing to is not available (mLab services stopped in Dec 2020).  [Attach a new Atlas database](../../update/newdatabase/).
- Your Atlas connection string is incorrect. Check [here](#bad-connection-string).

#### MongoDB paused

- If you haven't been using Nightscout for a while and it was working before, check your MongoDB Atlas database didn't go to sleep mode. If it did, select `Resume` to restart it. Once done, continue below with Heroku [restart all dynos](../../troubleshoot/troublehoot/#restart-all-dynos).

<img src="../img/TShoot53.png" style="zoom:80%;" >

</br>

If you see this message

<img src="../img/TShoot06.png" style="zoom:80%;" >

- [Update to latest version](../../update/redeploy/) and come back after you have a more accurate error message.

</br>

## MongoDB in read only mode

If you see this message:

<img src="../img/TShoot44.png" style="zoom:80%;" >

- Verify your Atlas database is not read only, if migration went well on the first time it should be like this, else click `Edit`

<img src="../img/TShoot15.png" style="zoom:80%;" >

- Change the permissions to `Atlas Admin` and `Update User`

<img src="../img/TShoot16.png" style="zoom:80%;" >

- Restart all dynos in Heroku

</br>

## `MONGODB_URI` missing

If you see this message:

<img src="../img/TShoot45.png" style="zoom:80%;" >

- If you forgot to migrate to Atlas you need to [attach a new Atlas database](../../update/newdatabase/).
- If you know you migrated, and your Nightscout was still functional after November 11th 2020, continue [below](./#bad-connection-string) to recover:

</br>

## Generic Unable to connect to Mongo

If you see this message:

<img src="../img/TShoot47.png" style="zoom:80%;" >

- Check you authorized all IPs to access your Atlas database:
- Open your Atlas cluster and select your Nightscout project, then `Network access`

<img src="../img/TShoot48.png" style="zoom:80%;" >

- If you see an IP (in red above) instead of 0.0.0.0/0 click `Edit` select `ALLOW ACCESS FROM ANYWHERE` then `Confirm`.

<img src="../img/TShoot49.png" style="zoom:80%;" >

- Restart all dynos in Heroku

</br>

## Bad connection string

If you see this message:

<img src="../img/TShoot46.png" style="zoom:80%;" >

</br>

- Open Heroku and `Reveal Config Vars` in `Settings`

<img src="../../update/img/MigrateNS03.png" style="zoom:80%;" >

</br>

- Search for a variable called `MONGODB_URI` or `MONGO_CONNECTION`. If you find none, go [here](./#recover-your-connection-string).

!!!warning " `MONGODB_URI` or `MONGO_CONNECTION`"
    There should be at least one and only one of them, not both.

If you migrated from mLab Heroku add-on it is usually `MONGO_CONNECTION`

if you deployed a brand new Nightscout it should be `MONGODB_URI`

- Verify it is looking like this: 

`mongodb+srv://atlasusername:atlaspassword@cluster0.zzzzz.mongodb.net/dbname?retryWrites=true&w=majority`

Note that your `atlasusername`, `atlaspassword` and `dbname` will be different from the example above.

- Paste the string in the box below:

<input type="text" id="myAtlas" value="Yes here. Delete this and paste it here" size="100">
</br>

- Click the `Analyze` button:

<button onclick="Analyze()">Analyze</button>

<p style="font-size:20px" id="result">Analysis result will appear here.</p>

If the analysis result doesn't show any error, check below the data is what you actually wanted:

**Database Username:** <p id="myUser">...</p>
**Database Password:** <p id="myPwd">...</p>
**Database name:** <p id="mydB">...</p>

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

!!! note
    If you migrated from Heroku mLab add-on, your database username and database name should be identical.

<img src="../img/TShoot41.png" style="zoom:80%;" >

</br>

If you've just created a new site, try to use [this help page](../../nightscout/stringhelp.html) to verify or recreate it.

</br>

If you're still in trouble continue below:

</br>

## Recover your connection string

If you've tried several times to deploy or migrate, you might end-up with many useless items in your accounts. At this point, you could benefit doing some cleanup in order to identify the correct Atlas database you want to connect to. Consider [cleanup](../cleanup/) before continuing.

</br>

a) Go to your MongDB account. Log in if necessary [https://cloud.mongodb.com/](https://cloud.mongodb.com/)

b) Click `Connect` below your cluster name (in the example below `Cluster0`, but it might have another name)

<img src="../img/TShoot07.png" style="zoom:80%;" >

</br>

c) Click `Connect your application`

<img src="../img/TShoot09.png" style="zoom:80%;" >

</br>

d) A new view opens, in  `(2) Add your connection string into your application code` you will find your MONGODB_URI or MONGO_CONNECTION string.

Click `Copy` then `Close`

<img src="../img/TShoot10.png" style="zoom:80%;" >

</br>

e) Paste it into a place where you can edit the text (i.e. a Word or a Notepad document).

Edit your string so that you add the database user password after the database user info. You defined them during your MongoDB Atlas database creation, when you reached [this step](../../nightscout/new_user/#h-add-a-database-username-for-example-nightscout-and-a-database-password-in-the-example-below-soo5ecret-but-please-change-it).

Here’s an example of how the string is built up:

`mongodb+srv://` `nightscout` `:`**`<password>`**`@cluster0.xxxxx.mongodb.net/`**`myFirstDatabase`**`?retryWrites=true&w=majority`

</br>

f) Edit your string in order to replace `<password>` with your database password.

g) If you don't remember your Atlas database password (which should not be your mongoDB Atlas account password) invent a new one (only letters and numbers).

Your string will now look like this: (do not use the same password as the example). Note there are no remaining `<` and `>`.

`mongodb+srv://nightscout:soo5ecret@cluster0.xxxxx.mongodb.net/myFirstDatabase?retryWrites=true&w=majority`

</br>

h) Copy this resulting string above into your Heroku variable `MONGODB_URI` (new Nightscout) or `MONGO_CONNECTION` (migration). There must be only one of these variables, not both. Open [this link](../../nightscout/new_user/#editing-config-vars-in-heroku) in another tab to see how to edit your Heroku variables.

i) If there is neither one nor the other create a new `MONGODB_URI` variable and paste the string in the value field.

j) If you remembered your password restart all dynos in Heroku, and you should be done.

k) If you changed your password or your Nightscout page still fails to open continue.

</br>

## Change your Atlas database password

- If you changed the password in the string you will need to change it in the database too:

- Click `Database Access`

<img src="../img/TShoot11.png" style="zoom:80%;" >

</br>

- At the end of the line, click `Edit`

<img src="../img/TShoot08.png" style="zoom:80%;" >

</br>

- In `Password` click `Edit Password`

  ***Note:*** *take a look at the top of this view, after `Edit User` you can see your database user name before `@`. Check it's matching the one in your connection string.* 

<img src="../img/TShoot12.png" style="zoom:80%;" >

</br>

- If you forgot your password invent a new one (use only letters and numbers: no special characters) or better: use `Autogenerate Secure Password` and click `Copy`
-  Else make it the same than the one in your Heroku `MONGODB_URI` connection string variable

<img src="../img/TShoot13.png" style="zoom:80%;" >

</br>

- Click `Update User`

<img src="../img/TShoot14.png" style="zoom:80%;" >

</br>

- Make sure the password matches in your connection string Heroku variable `MONGODB_URI` (new Nightscout) or `MONGO_CONNECTION` (migration)

- Refreshing your Nightscout web page display should be enough, but you can also [restart Heroku dynos](../../troubleshoot/troublehoot/#restart-all-dynos).