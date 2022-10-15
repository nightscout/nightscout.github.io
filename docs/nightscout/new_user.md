# New Nightscout Users

</br>

<span style="font-size:larger;">*"What is great is there will be multiple options for those interested in setting up the system! #wearenotwaiting" J.A.*</span></span>

</br>

<span style="font-size:larger;">Too complicated? Not what you're looking for?  Consider a hosted Nightscout service. Check [here](../../#nightscout-as-a-service).</span></br></br>
Interested in building a Nightscout DIY site?  Make sure you read and understand [this](/#how-much-does-it-cost) before starting.

</br>

## Building Nightscout DIY in a cloud platform



You can run your Nightscout site in several vendors platforms, using free or paid accounts.  
Traditionally the database holding Nightscout data is hosted by another provider (mLab, now MongoDB Atlas).

Below is a list of useable platforms. There are probably others, don't hesitate to [open an issue in the documentation](https://github.com/nightscout/nightscout.github.io/issues) with the easiest deployment method if you want to see them named here.

### MongoDB Atlas

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
A new deployment method is [being worked on](../../vendors/azure/new_user)... stay tuned.  
If you want to migrate and keep your Atlas database look [here](../../vendors/azure/migrate).

> **Pros**:  
> Large platform with a reliable history  
> Well known by the community IT specialists  
> Using a local database.
>
> **Cons**:  
> Hard con contain in the free tier

### Railway.app

You can easily [migrate from Heroku to Railway](../../vendors/railway/migration) or create a [new Railway Nightscout site](../../vendors/railway/new_user2) with a MongoDB Atlas or a Railway MongoDB database.

> **Pros**:  
> Nightscout fits in the free tier  
> Easy to deploy or migrate an existing site from Heroku  
> Simple to use and troubleshoot  
> Can use a native Railway MongoDB database
>
> **Cons**:  
> Startup company  
> A large amount of Nightscout users might have a negative impact on Railway financials and force them to review the free plan conditions  
> M5Stack_NightscoutMon users experience network issues provoking devices reset

### Northflank

You can create your new [Northflank](../../vendors/northflank/new_user) Nightscout site, with its own database or with a MongoDB Atlas or migrate from [Heroku to Northflank](../../vendors/northflank/migrate)*

> **Pros**:  
> Nightscout fits in the free tier  
> Easy to deploy or migrate an existing site from Heroku  
> Simple to use and troubleshoot  
> Can use a native Northflank MongoDB database
>
> **Cons**:  
> Small company  
> The Nightscout address generated for your site is impossible to remember (I know it sounds stupid but it is an issue)  
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

</br>

## Building Nightscout with your Synology NAS

Don't buy a Synology NAS device just for this, but if you already have one that's worth a try!  
You can host your Nightscout site in your [Synology](../../vendors/synology/new_user) NAS. 

</br>

## Building Nightscout DIY in a virtual server

You can run your Nightscout site in virtual private servers, using free or paid accounts.  
The [original](https://github.com/jasoncalabrese/project-glu/blob/master/README.md) Nightscout project was also developed to run in Digital Ocean.

Below is a list of some VPS. There are probably others, don't hesitate to [open an issue in the documentation](https://github.com/nightscout/nightscout.github.io/issues) with the easiest deployment method if you want to see them named here.

[Google Cloud](../../vendors/google/new_user) (from the xDrip+ developers team. Work in progress, great expectations!)  
[Digital Ocean](../../vendors/digitalocean/new_user)  
[MVPS](../../vendors/MVPS/new_user)  
[Oracle](../../vendors/oracle/new_user)  

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
    	<td>Free -></br></td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Medium</td>
    </tr>
    <tr>
        <td><a href="/vendors/railway/new_user"><img src="../../vendors/img/railway-app-logo.png" align="center"></a></td>
        <td>Free -></br>5$/month</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Medium</td>
    </tr>
    <tr>
        <td><a href="/vendors/northflank/new_user"><img src="../../vendors/img/Northflank.png" align="center"></a></td>
        <td>Free -></br>???$/month</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>Medium</td>
    </tr>
<tr>
        <td><a href="/vendors/fly.io/new_user"><img src="../../vendors/img/flyio-logo.png" align="center"></a></td>
        <td>Free -></br>5$/month</td>
        <td>Yes</td>
        <td>No</td>
        <td>High</td>
    </tr>
    <tr>
        <td><a href="/vendors/google/new_user"><img src="../../vendors/img/GoogleCloud.png" align="center"></td>
        <td>Free -></br>$/month</td>
        <td>Yes</td>
        <td>Yes</td>
        <td>High</td>
    </tr>    <tr>
        <td><a href="/vendors/oracle/new_user"><img src="../../vendors/img/Oracle.png" align="center"></td>
        <td>Free -></br>$/month</td>
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
    	<td>6$/month</td>
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
    <tr>
        <td><a href="/vendors/azure/new_user/"><img src="../../vendors/img/Azure.png" align="center"></a>	     </td>
        <td>variable</td>
        <td>Yes</td>
        <td>No</td>
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

