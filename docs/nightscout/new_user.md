# New Nightscout Users

</br>

<span style="font-size:larger;">*"What is great is there will be multiple options for those interested in setting up the system! #wearenotwaiting" J.A.*</span></span>

</br>

<span style="font-size:larger;">Too complicated? Not what you're looking for? </br>Consider a hosted Nightscout service. Check [here](../../#nightscout-as-a-service).</span></br></br>
Interested in building a Nightscout DIY site?  Make sure you read and understand [this](/#how-much-does-it-cost) before starting.

</br>

## Basic concepts

Even if knowing how it works is not mandatory, it is very useful to understand a few background concepts before starting DIY Nightscout.

1. The code available open source in [GitHub](https://github.com/nightscout/cgm-remote-monitor) or packaged for you in [Docker](https://hub.docker.com/u/nightscout) is the set of instruction that will be used to make your Nightscout. You don't need to understand it or be a programmer to use it.
2. Your Nightscout will usually be running in the internet cloud, meaning that somewhere on the planet, a computer or another will spend some of its time to keep your Nightscout active. This is the engine of Nightscout: it will make sure to be ready to accept the data you will send to it (BG, treatments, ...) or to answer to data requests when you ask them (BG, reports, ...) and even send alarms when instructed to do so. You will not see the engine work but you will see its frontpage: the web URL of your Nightscout site, which will be available on any device connected to the internet.
3. Since you will need to store a lot of data, Nightscout must have a database. This database will also be in the cloud, meaning data will be stored on one or more computers, somewhere. The Nightscout engine mentioned above will store and read data from this database whenever required.

<img src="../../img/nselements.png" style="zoom:80%;" />

From this you understand there are three main pieces necessary to build your Nightscout:

1. The Nightscout code also known as cgm-remote-monitor
2. A cloud platform running the Nightscout engine and web page
3. A cloud database storing data

Some platforms offer both engine and database like Azure, Railway, Northflank and all VPS servers. But you can use an external database if you want. Some others like Heroku or Fly.io don't propose a database and require you to use an external one. Traditionally the database holding Nightscout data is hosted by another provider (mLab, now MongoDB Atlas).

</br>  

## Building Nightscout DIY in a cloud platform

You can run your Nightscout site in several vendors platforms, using free or paid accounts.  

Below is a list of useable platforms. There are probably others, don't hesitate to [open an issue in the documentation](https://github.com/nightscout/nightscout.github.io/issues) with the easiest deployment method if you want to see them named here.

### MongoDB Atlas Database

MongoDB bought [mLab](https://twitter.com/chrisckchang/status/506959446753284096) in 2018 and shutdown its service in 2020. Most users migrated to MongoDB Atlas, using a free M0 database with a limited 512MB capacity. Leaving the database grow uncontrolled usually leads to a Nightscout crash.

Follow [these instructions](../../vendors/mongodb/atlas) to build a small database to host your Nightscout data if you don't already have one.

> **Pros**:  
> The M0 cluster is free  
> Nightscout was adapted to the MongoDB Atlas
>
> **Cons**:  
> There is no warranty the M0 cluster will remain in the future  
> A larger M2 cluster costs 9$ per month  
> A full M0 database crashes Nightscout

### Heroku

Heroku was a very popular platform for Nightscout until now. Most of the documentation is based on a Heroku Nightscout.  
On August 25th 2022, Salesforce decided to [drop the free plan](https://blog.heroku.com/next-chapter).  In order to keep your Nightscout running in Heroku, you can [upgrade to a Hobby account](../../vendors/heroku/hobbyplan).  
You can [create your new Nightscout site with Heroku](../../vendors/heroku/new_user) using a Hobby account plan (7$ / month).

> **Pros**:  
> Large platform with a reliable history  
> Well documented, well known by the community
>
> **Cons**:  
> For a Nightscout site 7$ per month is not really worth it  
> Relying on the MongoDB Atlas database

### Azure

Nightscout DIY was [originally](https://github.com/rnpenguin/cgm-remote-monitor) created with Azure but most users dropped it after costs increased.  
A new deployment method has [been created](../../vendors/azure/new_user).  
If you want to migrate and keep your Atlas database look [here](../../vendors/azure/migrate).

> **Pros**:  
> Large platform with a reliable history  
> Well known by the community IT specialists  
> Using a local database  
> Using a basic plan and free services make it free
>
> **Cons**:  
> Trial account lasts maximum 12 months  
> Basic plan and pay as you go is free if you stay within quotas

### Railway.app

You can easily [migrate from Heroku to Railway](../../vendors/railway/migration) or create a [new Railway Nightscout site](../../vendors/railway/new_user2) with a MongoDB Atlas or a Railway MongoDB database.

> **Pros**:  
> Nightscout fits in the free tier  
> Easy to deploy or migrate an existing site from Heroku  
> Simple to use and troubleshoot  
> Can use a native Railway MongoDB database ($)
>
> **Cons**:  
> Startup company  
> A large amount of Nightscout users might have a negative impact on Railway financials and force them to review the free plan conditions

### Northflank

You can create your new [Northflank](../../vendors/northflank/new_user) Nightscout site, with its own database or with a MongoDB Atlas or migrate from [Heroku to Northflank](../../vendors/northflank/migrate)*

> **Pros**:  
> Nightscout fits in the free tier  
> Easy to deploy or migrate an existing site from Heroku  
> Simple to use and troubleshoot  
> Can use a native Northflank MongoDB database ($)
>
> **Cons**:  
> Small company  
> The Nightscout address generated for your site is impossible to remember, you can fix this with a free DNS service  
> A large amount of Nightscout users might have a negative impact on Northflank financials and force them to review the free plan conditions  
> *Migration from Heroku requires the option to be enabled by Northflank support, making Nightscout users visible

### Fly.io

Fly.io proposes a [simple migration wizard from Heroku](../../vendors/fly.io/migrate) and you can create your [new Nightscout site in Fly.io](../../vendors/fly.io/new_user/). Using a computer is mandatory with Fly.io as managing your site will require the use of a command line utility. Not recommended for beginners.

> **Pros**:  
> Nightscout fits in the free tier  
> Easy to migrate an existing site from Heroku
>
> **Cons**:  
> Small company  
> Maintaining your site requires the use of a computer with command line instructions, not very intuitive  
> Migrated Heroku sites store variables as secrets

### Google Cloud

The xDrip+ developers team proposes [a simple scripted install in a Google Cloud free tier server](https://navid200.github.io/xDrip/docs/Nightscout/GoogleCloud).  
You don't need to know much about computers to install it, migrate from Heroku, get your data from another Nightscout, update, ... The solution is in progress and looks really great.

> **Pros**:  
> Nightscout and database fit in the free tier  
> Easy to migrate an existing site from Heroku  
> Easy to migrate data from another Nightscout  
> Easy to upgrade, backup, ...
>
> **Cons**:  
> You'll tell us

</br>

### VPS, NAS, other hardware

Need more? Look at [advanced](../advanced) install methods.

</br>

## Vendors comparison table

Click on the vendor logo.

<table style="padding:10px">
    <tr>
        <td>Vendor</td>
    	<td>Cost (USD)</td>
        <td>Web page</td>
        <td>Data base</td>
        <td>Complexity</td>
    </tr>
    <tr>
        <td><a href="/vendors/T1Pal/new_user/"><img src="../../vendors/img/T1Pal.png" align="center"></a></td>
    	<td>11.99$/month</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>None</td>
    </tr>
    <tr>
        <td><a href="/vendors/10BE/"><img src="../../vendors/img/10BE.png" align="center"></a></td>
    	<td>max 4.99€/month</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>None</td>
    </tr>
    <tr>
        <td><a href="/vendors/heroku/new_user/"><img src="../../vendors/img/Heroku.png" align="center"></a></td>
    	<td>7$/month</td>
        <td>Yes</td>
        <td>No</td>
        <td>Medium</td>
    </tr>
    <tr>
        <td><a href="/vendors/mongodb/atlas/#create-an-atlas-database"><img src="../../vendors/img/Atlas.png" align="center"></a></td>
        <td>Free -></br>9$/month</br></td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Medium</td>
    </tr>
    <tr>
        <td><a href="/vendors/azure/new_user/"><img src="../../vendors/img/Azure.png" align="center"></a>	     </td>
        <td>Free -></br>?$/month</td>
        <td>Yes</td>
        <td>No</td>
        <td>High</td>
     </tr>
    <tr>
        <td><a href="/vendors/railway/new_user"><img src="../../vendors/img/railway-app-logo.png" align="center"></a></td>
        <td>Free -></br>?$/month</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Medium</td>
    </tr>
    <tr>
        <td><a href="/vendors/northflank/new_user"><img src="../../vendors/img/Northflank.png" align="center"></a></td>
        <td>Free -></br>?$/month</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Medium</td>
    </tr>
<tr>
        <td><a href="/vendors/fly.io/new_user"><img src="../../vendors/img/flyio-logo.png" align="center"></a></td>
        <td>Free -></br>?$/month</td>
        <td>Yes</td>
        <td>No</td>
        <td>High</td>
    </tr>
    <tr>
        <td><a href="/vendors/google/new_user"><img src="../../vendors/img/GoogleCloud.png" align="center"></td>
        <td>Free -></br>?$/month</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>High</td>
    </tr>    <tr>
        <td><a href="/vendors/oracle/new_user"><img src="../../vendors/img/Oracle.png" align="center"></td>
        <td>Free -></br>?$/month</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>High</td>
    </tr>
    <tr>
        <td><a href="/vendors/MVPS/new_user"><img src="../../vendors/img/MVPS.png" align="center"></td>
    	<td>4€/month</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>High</td>
    </tr>
    <tr>
        <td><a href="/vendors/digitalocean/new_user"><img src="../../vendors/img/DO.png" align="center"></a></td>
    	<td>4$/month</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>High</td>
    </tr>
    <tr>
        <td><img src="../../vendors/img/RPi.png" align="center"></td>
    	<td>Hardware</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>High</td>
    </tr>
    <tr>
        <td><a href="/vendors/synology/new_user/"><img src="../../vendors/img/Synology.png" align="center"></td>
    	<td>Hardware</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>High</td>
    </tr>
</table>



</br>

## Security and safekeeping

It's **highly important** you understand you have to take computer security seriously when setting up Nightscout. We assume you have full legal ownership of all data being stored in your installation of Nightscout and that there are thus no liabilities you'd need to respond to regarding the data. Depending on how you use Nightscout, an unauthorized user could cause harm by for example changing the CGM data shown by Nightscout. We have no evidence of this having ever happened to anyone, but to keep it that way, take the following guidelines to heart:

- Do not use the same password for all your accounts, and choose passwords that are not easy to guess.
- Do not use the API_SECRET for the Atlas database password.
- Do not use your Dexcom or CareLink user name or password for Nightscout components.
- Do not share the API_SECRET or other passwords to your accounts to others.
- Do not use Nightscout or any related applications on rooted and/or otherwise compromized devices, and ensure you always have the latest operating system and virus protection updates installed.

If you want to read more about Nightscout security, including about additional configuration options to make your installation more secure, please check our [security guide](../security/).

</br>

##### Record your information in a safe place.

You can either print this [pdf document](./NightscoutDataRecord.pdf) or edit the [Word version](./NightscoutDataRecord.docx), or this [Excel sheet](./NightscoutDataRecord.xlsx), to record all information during installation. Store it together securely with your diabetes documentation.

