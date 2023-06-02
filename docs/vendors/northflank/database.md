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

**Cons**:  
* Billing starts at 0.3$ plus 0.3$ per additional GiB (it can take years to reach 1GiB for Nightscout)
```

</br>

If you already have a Northflank account, [log in](https://app.northflank.com/login) and [continue (skip new account creation)](#create-your-database).

**Else**

## Create an account with Northflank

a) Sign-up to [Northflank](https://app.northflank.com/signup) in a new browser tab.  
Fill all required fields and `Sign up`.  
You can also sign up with Google, GitHub, ... if you wish.

<img src="./img/Northflank00a.png" width="400px" />

</br>

Northflank will send you an email to complete the registration.

<img src="./img/Northflank00b.png" width="500px"  />

</br>

b) Open your email and confirm with `Verify email`.

<img src="./img/Northflank00c.png" width="500px"  />

</br>

c) Click `Choose theme`.

<img src="./img/Northflank04.png" width="500px" />

</br>

d) Select `Skip for now`.

<img src="./img/Northflank05.png" width="500px"  />

</br>

e) Click `Create free project`

<img src="./img/Northflank06.png" width="200px"/>

</br>

f) Invent a project name (`nightscout` for example) and select a region (Europe or US) then click `Create project`

<img src="./img/Northflank07.png" width="500px"  />

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

<img src="./img/NorthflankDB01.png"  width="300px"  />

</br>

b) Select your account and your project name (see below if you don't have one yet).

<img src="./img/NorthflankDB02.png" width="500px" />

</br>

If you don't have a project in Northflank, create a new one with `Create project` and then select `Create free project` else skip to **c)**.

<img src="./img/NorthflankDB02a.png" width="500px" />

<img src="./img/Northflank06.png" width="200px" />

Invent a project name (`nightscout` for example) and select a region (Europe or US) then click `Create project`

<img src="./img/Northflank07.png" width="500px" />

</br>

c) Select `Deploy addons`.

<img src="./img/NorthflankDB07.png" width="500px"/>

</br>

d) Select `MongoDB` and type a name for your addon (not important) in `Addon name`.

<img src="./img/NorthflankDB08.png" width="600px" />

</br>

e) The database add-on configuration displays, scroll down.

*Note: if you know what you're doing, all Mongo versions are supported by Nightscout: you can select the one you prefer.*

**Important:** If you will use this database with a Nightscout that is not in Northflank, you must enable `Publicly accessible`.  
If you will deploy Nightscout in Northflank, you can leave it disabled.

<img src="./img/NorthflankDB06.png" width="600px" />

</br>

f) Select `Create addon`

<img src="./img/NorthflankDB03.png" width="600px"/>

</br>

g) If you haven't yet, you need to add a payment method into Northflank.  
You will be charged monthly for your database (0.3$ up to 1 GiB, then 0.3$/GiB).

<img src="./img/Northflank23.png" width="400px" />

</br>

g) Enter your password and click `Confirm` to see your MongoDB information.

<img src="./img/NorthflankDB04.png" width="400px" />

</br>

h) Click the copy icon of the line `EXTERNAL_SRV`.

<img src="./img/NorthflankDB05.png" width="600px" />

</br>

```{admonition} This is an important information
:class: warning
Now that you have **copied** the resulting `MONGODB_URI` string, keep it in a **safe place**, you will need it later.
```

</br>

i) Wait until your database is fully created. It might take some time.

<img src="./img/NorthflankDB09.png" width="600px" />

</br>