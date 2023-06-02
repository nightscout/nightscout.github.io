# Choose your platform

```{admonition} Too complicated? Not what you're looking for?
:class: seealso
Consider a hosted Nightscout service! Check for easier solutions [here](/index.md#nightscout-as-a-service).
```

</br>

Various platforms are available to host your Nightscout site in the cloud.

```{warning}
**Creating a [database](/nightscout/database) is mandatory if you want to use: Heroku, Railway, Northflank, Fly.io or Azure.**
Make sure you have one before creating a Nightscout web app in these platforms.
```

Find a list of commonly used hosting services below, decide which one you'll want to use. 

</br>

```{card}
## Heroku
![Heroku Eco](/vendors/img/Heroku.png)
^^^
Since the [beginning](https://github.com/nightscout/cgm-remote-monitor/pull/98) Heroku has been a very popular platform for Nightscout. Most of the documentation was based on a Heroku Nightscout.  
On August 25th 2022, Salesforce decided to [drop the free plan](https://blog.heroku.com/next-chapter). 
You can [create your new Nightscout site with Heroku](/vendors/heroku/new_user) using an Eco plan (5$/month).

**Pros**:  
* Large platform with a reliable history
* Well documented, well known by the community

**Cons**:  
* The Eco plan has the same limitations than the previous Free plan, for 5$ per month
* For a Nightscout site a 7$ per month Basic plan is not really worth it (compared to hosted solutions)
* Relying on the MongoDB Atlas database

+++
Follow [these instructions](/vendors/heroku/new_user.md) to build your Nightscout site in Heroku.
```

```{card}
## Azure
![Azure](/vendors/img/Azure.png)
^^^
Nightscout DIY was [originally](https://github.com/rnpenguin/cgm-remote-monitor) created with Azure but most users dropped it after costs increased.  
A new deployment method has [been created using a Docker container](/vendors/azure/new_user).  

**Pros**:  
* Large platform with a reliable history
* Well known by the community IT specialists
* Using a basic plan and free services keep it free

**Cons**:  
* Trial account lasts maximum 12 months
* Basic plan and pay as you go is free if you stay within quotas
* The F1 free app service plan is designed for testing, not production
**The Cosmos database doesn't integrate correctly with Nightscout**

+++
Follow [these instructions](/vendors/azure/new_user.md) to build your Nightscout site in Azure.
```

```{card}
## Railway.app
![Railway](/vendors/img/Railway.png)
^^^
You can easily create a new Railway Nightscout site with a MongoDB Atlas or a Railway MongoDB database.

**Pros**:  
* Nightscout fits in the free tier using a developer account  
* Easy to deploy or migrate an existing site from Heroku  
* Simple to use and troubleshoot  
* Can use a native Railway MongoDB database ($)  

**Cons**:
* Your GitHub account must have been created more than 3 months ago
* The railway.app domain is blocked for safety by some companies  
* Railway network model causes issues with some follower app and devices 

+++
Follow [these instructions](/vendors/railway/new_user.md) to build your Nightscout site in Railway.
```

```{card}
## Northflank
![](/vendors/img/Northflank.png)
^^^
You can create your new Northflank Nightscout site, with its own Northflank database or with a MongoDB Atlas database.

**Pros**:  
* Nightscout fits in the free tier  
* Easy to deploy or migrate an existing site from Heroku  
* Simple to use and troubleshoot  
* Can use a native Northflank MongoDB database ($)  

**Cons**:  
* The Nightscout address generated for your site is impossible to remember, you can fix this with a [DNS service](/nightscout/dns) 

+++
Follow [these instructions](/vendors/northflank/new_user.md) to build your Nightscout site in Northflank.
```

```{card}
## Fly.io
![Fly.io](/vendors/img/Fly.io.png)
^^^
Fly.io proposed a simple migration wizard from Heroku and you can create your new Nightscout site in Fly.io. Using a computer is mandatory with Fly.io as managing your site will require the use of a command line utility. Not recommended for beginners.

**Pros**:  
* Nightscout fits in the free tier  
* Easy to migrate an existing site from Heroku 

**Cons**:  
* **Maintaining your site requires the use of a computer with command line instructions, not very intuitive**  
* Migrated Heroku sites store variables as secrets  
* Relying on the MongoDB Atlas database  

+++
Follow [these instructions](/vendors/fly.io/new_user.md) to build your Nightscout site in Fly.io.
```

```{card}
## Google Cloud
![xDrip+](/vendors/img/GoogleCloud.png)
^^^
A scripted Nightscout installation in Google Cloud is a new complete solution proposed by the xDrip+ developers team. Whilst deploying Nightscout manually in Ubuntu can be complex, their approach makes is rather simple for non-technical people.

**Pros**:  
* Complete solution offering a large free database  
* A web interface to edit your variables
* Tools provided to migrate the database from another platform
* Virtually free (<5c/month)

**Cons**:
* Not available for free for Australia and Cina users
* Relying on a free DNS provider

+++
Follow [these instructions](https://navid200.github.io/xDrip/docs/Nightscout/GoogleCloud.html) to build your Nightscout site in Google Cloud.
```

