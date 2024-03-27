# Choose your database

```{admonition} Too complicated? Not what you're looking for?
:class: seealso
Consider a hosted Nightscout service! Check for easier solutions [here](/index.md#nightscout-as-a-service).
```

</br>

You must create a database unless it's already included in the platform you selected, check below.

````{tab-set}

:::{tab-item} Select your platform ->
</br>
:::

:::{tab-item} Heroku/Railway/Azure/Northflank/Fly.io
You need to create a database.
:::

:::{tab-item} Google Cloud script
You don't need to create a database: continue [**here**](https://navid200.github.io/xDrip/docs/Nightscout/GoogleCloud.html)
:::

:::{tab-item} Hosted
You don't need to create a database: go directly to the [hosting site](/index.md#nightscout-as-a-service).
:::

````

</br>

Find a list of commonly used database hosting services below, decide which one you'll want to use and create your database. 

</br>

```{warning}
Using a free, limited size database (like M0 Atlas) means you will have to maintain it. </br>
Since it will regularly grow with the data you send to Nightscout, take a note to perform **regular cleanup** to avoid your site crashing.
```

```{card}
## MongoDB Atlas Database
![MongoDB Atlas](/vendors/img/Atlas.png)
^^^
MongoDB bought [mLab](https://twitter.com/chrisckchang/status/506959446753284096) in 2018 and shutdown its service in 2020. Most users migrated to MongoDB Atlas, using a free M0 database with a limited 512MB capacity.

**Pros**:  
* The M0 cluster is free  
* Nightscout was adapted to MongoDB Atlas

**Cons**:  
* M0 clusters are designed for learning and testing, not production: performance and availability are not guaranteed
* There is no warranty the M0 cluster will remain in the future  
* A larger M2 cluster costs 9$ per month (not competitive against hosted solutions)
* A full M0 database crashes Nightscout, this is a common issue for DIY closed loop system users
+++
Follow [these instructions](/vendors/mongodb/atlas.md) to build a small database to host your Nightscout data if you don't already have one.
```

```{card}
## Railway Mongo Database
![Railway](/vendors/img/Railway.png) ![MongoDB](/vendors/img/MongoDB.png)
^^^
Railway offers a Mongo database.

**Pros**:  
* Simple to create  
* Less overhead than Atlas (more space)  

**Cons**:  
* Requires a 5$/month hobby plan as billing starting amount
* Running a database together with a Railway Nightscout site will increase billing above ~200MiB used
* Simple Mongo 4.4 database
+++
Follow [these instructions](/vendors/railway/database.md) to create a database in Railway.
```

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
* Billing will occur but the cost is really limited: 0.3$ per GiB (it usually takes years to reach 1GB for Nightscout)
* There is no warranty this offer will be maintained in the future
+++
Follow [these instructions](/vendors/northflank/database.md) to create a database in Northflank.
```

```{card}
## VPS Mongo Database
![MongoDB](/vendors/img/MongoDB.png)
^^^
You can create a Mongo Database in a Virtual Private Server, either using a free plan (Oracle, Google) or a paid account (Digital Ocean and so many others ...).

**Pros**:
* Lot of space
* Standard community method largely supported by IT specialists

**Cons**:
* Requires commands to be typed and some IT knowledge
+++
Waiting for something easier (work in progress) [these are the instruction](https://www.mongodb.com/docs/manual/administration/install-on-linux).
```

