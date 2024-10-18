# Northflank Database

</br>

```{admonition} Too complicated? Not what you're looking for?
:class: seealso
Consider a hosted Nightscout service! Check for easier solutions [here](/index.md#nightscout-as-a-service).
```

</br>

```{card}
## Northflank Mongo Database
![Northflank](/vendors/img/Northflank.png) ![MongoDB](/vendors/img/MongoDB.png)
^^^
Northflank offers a Mongo database.

**Pros**:  
* Simple to create  
* Economic reliable database
* High quality Mongo database with a replica set
* You can deploy up to $20/mo worth of free resources on Northflank’s managed cloud

**Cons**:  
* Heroku Nightscout might crash with database timeouts
```

</br>

If you already have a Northflank account, [log in](https://app.northflank.com/login) and [continue (skip new account creation)](#create-your-database).

**Else**

## Create an account with Northflank

a) Sign-up to [Northflank](https://app.northflank.com/signup) in a new browser tab.  
Fill all required fields and `Sign up`.  
You can also sign up with Google, GitHub, ... if you wish.

<img src="/vendors/northflank/img/Northflank00a.png" width="400px" />

</br>

Northflank will send you an email to complete the registration.

<img src="/vendors/northflank/img/Northflank00b.png" width="500px"  />

</br>

b) Open your email and confirm with `Verify email`.

<img src="/vendors/northflank/img/Northflank00c.png" width="500px"  />

</br>

c) Click `Choose theme`.

<img src="/vendors/northflank/img/Northflank04.png" width="500px" />

</br>

d) Select `Skip for now`.

<img src="/vendors/northflank/img/Northflank05.png" width="500px"  />

</br>

e) Click `Create free project`

<img src="/vendors/northflank/img/Northflank06.png" width="200px"/>

</br>

f) Invent a project name (`nightscout` for example) and select a region (Europe or US) then click `Create project`

<img src="/vendors/northflank/img/Northflank07.png" width="500px"  />

</br>

</br>

## Create your database

```{admonition} Costs
:class: warning
* The Mongo database is free, you only pay for the storage
* Minimum price is 0.3$/month, cost is then 0.3$/GiB/month
* A good database is important for your Nightscout site reliability
```

</br>

a) Open a new browser page [https://northflank.com/dbaas/mongodb-on-northflank](https://northflank.com/dbaas/mongodb-on-northflank) and click `Deploy MongoDB on Northflank for free`

<img src="/vendors/northflank/img/NorthflankDB01.png"  width="300px"  />

</br>

b) Select your account and your project name (see below if you don't have one yet).

<img src="/vendors/northflank/img/NorthflankDB02.png" width="500px" />

</br>

If you don't have a project in Northflank, create a new one with `Create project` and then select `Create free project` else skip to **c)**.

<img src="/vendors/northflank/img/NorthflankDB02a.png" width="500px" />

<img src="/vendors/northflank/img/Northflank06.png" width="200px" />

Invent a project name (`nightscout` for example) and select a region (Europe or US) then click `Create project`

<img src="/vendors/northflank/img/Northflank07.png" width="500px" />

</br>

c) Select `Deploy addons`.

<img src="/vendors/northflank/img/NorthflankDB07.png" width="500px"/>

</br>

d) Select `MongoDB` and type a name for your addon (not important) in `Addon name`.

<img src="/vendors/northflank/img/NorthflankDB08.png" width="600px" />

</br>

e) Select a Mongo version if you want.

All Mongo versions are supported by Nightscout: you can select the one you prefer.  
Since recent versions don't add value, you can safely select an older version like 5.0.24.

<img src="/vendors/northflank/img/NorthflankDB10.png" width="600px" />

</br>

**Important:** If you will use this database with a Nightscout that is not in Northflank, you must enable `Publicly accessible`.  
If you will deploy Nightscout in Northflank, you can leave it disabled.

<img src="/vendors/northflank/img/NorthflankDB06.png" width="600px" />

</br>

f) Select `Create addon`

<img src="/vendors/northflank/img/NorthflankDB03.png" width="600px"/>

</br>

g) If you haven't yet, you need to add a payment method into Northflank.  
You will be charged monthly for your database (0.3$ up to 1 GiB, then 0.3$/GiB).

<img src="/vendors/northflank/img/Northflank23.png" width="400px" />

</br>

g) Enter your password and click `Confirm` to see your MongoDB information.

<img src="/vendors/northflank/img/NorthflankDB04.png" width="400px" />

</br>

h) Click the copy icon of the line `MONGO_SRV`.

<img src="/vendors/northflank/img/NorthflankDB05.png" width="600px" />

</br>

```{admonition} This is an important information
:class: warning
Now that you have **copied** the resulting `MONGODB_URI` string, keep it in a **safe place**, you will need it later.
```

</br>

i) Wait until your database is fully created. It might take some time.

<img src="/vendors/northflank/img/NorthflankDB09.png" width="600px" />

</br>