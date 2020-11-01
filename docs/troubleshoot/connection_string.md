## Unable to connect to Mongo

Common reasons:

- The database Heroku is pointing to is not available (like mLab after Nov 10th 2020).

- Your Atlas connection string is incorrect

  </br>

<img src="../img/TShoot06.png" style="zoom:80%;" >

</br>

- Open Heroku and `Reveal Config Vars` in `Settings`

<img src="../../update/img/MigrateNS03.png" style="zoom:80%;" >

</br>

- Search for a variable called `MONGODB_URI` or `MONGO_CONNECTION`. There should be only one of them, not both. If you migrated from mLab you should have `MONGO_CONNECTION`, if you deployed a brand new Nightscout it should be `MONGODB_URI`.
- Verify it is looking like this (`atlasusername`, `atlaspassword`, `dbname` will be different from the example below). 

`mongodb+srv://atlasusername:atlaspassword@cluster0.zzzzz.mongodb.net/dbname?retryWrites=true&w=majority`

- Paste the string in the box below:

<input type="text" id="myAtlas" value="" size="100">
</br>

- Click the `Analyze` button:

<button onclick="Analyze()">Analyze</button>

<p style="font-size:20px" id="result">Analysis result will appear here.</p>

If the analysis result doesn't show any error, check below the data is what you actually wanted:

**Username: <p id="myUser">...</p>
Password:** <p id="myPwd">...</p>
**Database: **<p id="mydB">...</p>

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
    If you migrated from mLab your username and database name should be identical.

<img src="../img/TShoot41.png" style="zoom:80%;" >

</br>

- If you've just migrated to Atlas, try to use [this help page](../../update/stringhelp.html) to verify or recreate it.
- If you've just created a new site, try to use [this help page](../../nightscout/stringhelp.html) to verify or recreate it.
- If you're still in trouble change your database password:

</br>

## Change your Atlas database password

- To recover your connection string log into [Atlas](https://cloud.mongodb.com/)
- Click `Connect` on your cluster

<img src="../img/TShoot07.png" style="zoom:80%;" >

</br>

- Click `Connect your application`

<img src="../img/TShoot09.png" style="zoom:80%;" >

</br>

- Click `Copy` then `Close`

<img src="../img/TShoot10.png" style="zoom:80%;" >

</br>

- Open the [the help page](../../nightscout/stringhelp.html) in a new tab and paste the string in the first field.

!!! warning "If you migrated from mLab and Heroku (not Azure)"
    **Your database name should be identical to your database user name!** (Unless you modified it) "

- If you don't remember your password invent a new one.
- Copy the resulting string in your Heroku variable `MONGODB_URI` (new Nightscout) or `MONGO_CONNECTION` (migration)
- If you changed the password in the string you need to change it in the database too:
- Click `Database Access`

<img src="../img/TShoot11.png" style="zoom:80%;" >

</br>

- At the end of the line, click `Edit`

<img src="../img/TShoot08.png" style="zoom:80%;" >

</br>

- In `Password` click `Edit Password`

<img src="../img/TShoot12.png" style="zoom:80%;" >

</br>

- Write down your new password make it the same than the one in your connection string

<img src="../img/TShoot13.png" style="zoom:80%;" >

</br>

- Click `Update User`

<img src="../img/TShoot14.png" style="zoom:80%;" >

</br>

- Refresh your Nightscout web page display