# New Nightscout Users

</br>

<span style="font-size:larger;">*"What is great is there will be multiple options for those interested in setting up the system! #wearenotwaiting" J.A.*</span></span>

</br>

!!!info "Too complicated? Not what you're looking for? Consider a hosted Nightscout service! Check for easier solutions [here](../../#nightscout-as-a-service)."  
<span style="font-size:larger;">Interested in building a Nightscout DIY site?  Make sure you **read and understand [this](/#how-much-does-it-cost)** before starting.</span>

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
> M0 clusters are designed for learning and testing, not production  
> There is no warranty the M0 cluster will remain in the future  
> A larger M2 cluster costs 9$ per month  
> A full M0 database crashes Nightscout

### Heroku

Since the [beginning](https://github.com/nightscout/cgm-remote-monitor/pull/98) Heroku has been a very popular platform for Nightscout. Most of the documentation is based on a Heroku Nightscout.  
On August 25th 2022, Salesforce decided to [drop the free plan](https://blog.heroku.com/next-chapter).  
In order to keep your Nightscout running in Heroku, you can [upgrade to an Eco plan](../../vendors/heroku/ecoplan) or a [Basic plan](../../vendors/heroku/hobbyplan).  
You can [create your new Nightscout site with Heroku](../../vendors/heroku/new_user) using an Eco plan (5$ / month).

> **Pros**:  
> Large platform with a reliable history  
> Well documented, well known by the community
>
> **Cons**:  
> For a Nightscout site a 7$ per month Basic plan is not really worth it (compared to hosted solutions)  
> The Eco plan has the same limitations than the previous Free plan, for 5$ per month  
> Relying on the MongoDB Atlas database

### Azure

Nightscout DIY was [originally](https://github.com/rnpenguin/cgm-remote-monitor) created with Azure but most users dropped it after costs increased.  
A new deployment method has [been created using a Docker container](../../vendors/azure/new_user).  
If you want to migrate and keep your Atlas database look [here](../../vendors/azure/migrate).

> **Pros**:  
> Large platform with a reliable history  
> Well known by the community IT specialists  
> Using a basic plan and free services keep it free
> 
>**Cons**:  
> Trial account lasts maximum 12 months  
> Basic plan and pay as you go is free if you stay within quotas  
> The F1 free app service plan is designed for testing, not production  
> The Cosmos database doesn't integrate completely with Nightscout

### Railway.app

You can easily [migrate from Heroku to Railway](../../vendors/railway/migration) or create a [new Railway Nightscout site](../../vendors/railway/new_user2) with a MongoDB Atlas or a Railway MongoDB database.

> **Pros**:  
> Nightscout fits in the free tier using a developer account  
> Easy to deploy or migrate an existing site from Heroku  
> Simple to use and troubleshoot  
> Can use a native Railway MongoDB database ($)
>
> **Cons**:  
> The railway.app domain is blocked for safety by some companies  
> Startup company  
> A large amount of Nightscout users might have a negative impact on Railway financials and force them to review the free plan conditions  
> Railway network model causes issues with some follower app and devices

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
> Relying on the MongoDB Atlas database

### Google Cloud

The xDrip+ developers team proposes [a simple scripted install in a Google Cloud free tier server](https://navid200.github.io/xDrip/docs/Nightscout/GoogleCloud).  
You don't need to know much about computers to install it, migrate from Heroku, get your data from another Nightscout or update. This is  great solution.

> **Pros**:  
> Nightscout and database fit in the free tier  
> A large database space  
> Easy to migrate an existing site from Heroku  
> Easy to migrate data from another Nightscout  
> Easy to upgrade, backup, ...
>
> **Cons**:  
> Limited outgoing bandwidth (1GB/month)  
> The community needs to build knowledge to help users troubleshoot issues

</br>

### VPS, NAS, other hardware

Need more? Look at [advanced](../advanced) install methods.

</br>

## Vendors comparison table

<head>
<style id="Book1_543_Styles"><!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
.xl65543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl66543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:white;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#404040;
	mso-pattern:black none;
	white-space:normal;}
.xl67543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:white;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	background:#404040;
	mso-pattern:black none;
	white-space:normal;}
.xl68543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:white;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	background:#404040;
	mso-pattern:black none;
	white-space:nowrap;}
.xl69543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:normal;}
.xl70543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:normal;}
.xl71543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:normal;}
.xl72543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:normal;}
.xl73543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:normal;}
.xl74543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:normal;}
.xl75543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:normal;}
.xl76543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:normal;}
.xl77543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:normal;}
.xl78543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:normal;}
.xl79543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:normal;}
.xl80543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCCCC;
	mso-pattern:black none;
	white-space:normal;}
.xl81543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:normal;}
.xl82543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:normal;}
.xl83543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:normal;}
.xl84543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:nowrap;}
.xl85543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:nowrap;}
.xl86543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:nowrap;}
.xl87543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:nowrap;}
.xl88543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:nowrap;}
.xl89543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:nowrap;}
.xl90543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:nowrap;}
.xl91543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:nowrap;}
.xl92543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:nowrap;}
.xl93543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:nowrap;}
.xl94543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:nowrap;}
.xl95543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:nowrap;}
.xl96543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl97543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl98543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl99543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl100543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl101543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:nowrap;}
.xl102543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:nowrap;}
.xl103543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:nowrap;}
.xl104543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl105543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl106543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl107543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl108543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"_\(\0022$\0022* \#\,\#\#0\.00_\)\;_\(\0022$\0022* \\\(\#\,\#\#0\.00\\\)\;_\(\0022$\0022* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl109543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\\ \[$€-1\]\;\[Red\]\\-\#\,\#\#0\\ \[$€-1\]";
	text-align:center;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl110543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"\0022$\0022\#\,\#\#0_\)\;\[Red\]\\\(\0022$\0022\#\,\#\#0\\\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
--></style>
</head>
<body>

<div id="Book1_543" align=center x:publishsource="Excel">
<table border=0 cellpadding=0 cellspacing=0 width=742 class=xl65543
 style='border-collapse:collapse;table-layout:fixed;width:558pt;box-sizing: inherit;
 border-spacing: 0px;display:inline-block;background-color:var(--md-default-bg-color);
 border:0.05rem solid var(--md-typeset-table-color);border-radius: 0.1rem;
 font-size:0.64rem;max-width:100%;touch-action: auto;color:rgba(0, 0, 0, 0.87);
 font-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;
 text-align:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: initial;
 text-decoration-style: initial;text-decoration-color: initial'>
 <col class=xl96543 width=113 style='mso-width-source:userset;mso-width-alt:
 3612;width:85pt'>
 <col class=xl96543 width=142 style='mso-width-source:userset;mso-width-alt:
 4551;width:107pt'>
 <col class=xl96543 width=72 style='mso-width-source:userset;mso-width-alt:
 2304;width:54pt'>
 <col class=xl96543 width=94 style='mso-width-source:userset;mso-width-alt:
 3015;width:71pt'>
 <col class=xl65543 width=321 style='mso-width-source:userset;mso-width-alt:
 10268;width:241pt'>
 <tr height=21 style='height:16.0pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=21 class=xl66543 width=113 style='height:16.0pt;width:85pt;
  box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Vendor</td>
  <td class=xl67543 width=142 style='width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Cost/month</td>
  <td class=xl67543 width=72 style='width:54pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>Database</td>
  <td class=xl67543 width=94 style='width:71pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>Complexity</td>
  <td class=xl68543 width=321 style='width:241pt'>Limitations</td>
 </tr>
 <tr height=25 style='height:18.7pt'>
  <td colspan=5 height=25 class=xl101543 style='border-right:1.0pt solid black;
  height:18.7pt'>Hosted solutions</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=20 class=xl74543 width=113 style='height:15.35pt;border-top:none;
  width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>T1Pal</td>
  <td class=xl108543 width=142 style='border-top:none;width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'><span
  style='mso-spacerun:yes'> </span>11.99$<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>2GB</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Low</td>
  <td class=xl105543 style='border-top:none'>Loop remote carbs/bolus require
  extra service</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=20 class=xl74543 width=113 style='height:15.35pt;border-top:none;
  width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>NS10BE</td>
  <td class=xl108543 width=142 style='border-top:none;width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'><span
  style='mso-spacerun:yes'> </span>&lt; 5€<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>20GB</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Low</td>
  <td class=xl105543 style='border-top:none'>&nbsp;</td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td height=21 class=xl69543 width=113 style='height:16.0pt;width:85pt'>Nightscout
  Pro</td>
  <td class=xl109543 width=142 style='width:107pt'>3£</td>
  <td class=xl97543 width=72 style='width:54pt'>20GB</td>
  <td class=xl97543 width=94 style='width:71pt'>Low</td>
  <td class=xl98543>&nbsp;</td>
 </tr>
 <tr height=25 style='height:18.7pt'>
  <td colspan=5 height=25 class=xl84543 style='border-right:1.0pt solid black;
  height:18.7pt'>Platforms as a service</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td rowspan=2 height=40 class=xl75543 width=113 style='border-bottom:.5pt solid black;
  height:30.7pt;border-top:none;width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Heroku</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>5$ Eco plan</td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>No</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl105543 style='border-top:none'>Will sleep without an active
  up/downloader</td>
 </tr>
 <tr height=20 style='height:15.35pt'>
  <td height=20 class=xl106543 width=142 style='height:15.35pt;width:107pt'>7$
  Basic plan</td>
  <td class=xl106543 width=72 style='width:54pt'>No</td>
  <td class=xl106543 width=94 style='width:71pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl107543>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=20 class=xl77543 width=113 style='height:15.35pt;border-top:none;
  width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Azure</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Free Basic plan</td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Issues</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl105543 style='border-top:none'>Basic B1 is too limited for FAPSX</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=20 class=xl77543 width=113 style='height:15.35pt;border-top:none;
  width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Railway</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Free Developer plan</td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Yes</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl105543 style='border-top:none'>Some followers experience issues</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=20 class=xl77543 width=113 style='height:15.35pt;border-top:none;
  width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Northflank</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt'>Free
  Developer plan</td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Yes</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl105543 style='border-top:none'>&nbsp;</td>
 </tr>
 <tr height=21 style='height:16.0pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=21 class=xl70543 width=113 style='height:16.0pt;width:85pt;
  box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Fly.io</td>
  <td class=xl99543 width=142 style='width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Free Hobby plan</td>
  <td class=xl99543 width=72 style='width:54pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>No</td>
  <td class=xl99543 width=94 style='width:71pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>High</td>
  <td class=xl100543>&nbsp;</td>
 </tr>
 <tr height=25 style='height:18.7pt'>
  <td colspan=5 height=25 class=xl87543 style='border-right:1.0pt solid black;
  height:18.7pt'>Databases</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td rowspan=2 height=40 class=xl78543 width=113 style='border-bottom:.5pt solid black;
  height:30.7pt;border-top:none;width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Atlas</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Free M0 tier</td>
  <td class=xl80543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>512MB</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl105543 style='border-top:none'>Very small for Loop/AAPS</td>
 </tr>
 <tr height=20 style='height:15.35pt'>
  <td height=20 class=xl110543 width=142 style='height:15.35pt;width:107pt'>9$
  M2 tier</td>
  <td class=xl106543 width=72 style='width:54pt'>2GB</td>
  <td class=xl106543 width=94 style='width:71pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl107543>Not worth the cost compared to hosted solutions</td>
 </tr>
 <tr height=20 style='height:15.35pt'>
  <td height=20 class=xl81543 width=113 style='height:15.35pt;border-top:none;
  width:85pt'>Azure</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt'>Free Basic
  plan</td>
  <td class=xl80543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Issues</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl105543 style='border-top:none'>Cosmos is not supported correctly</td>
 </tr>
 <tr height=20 style='height:15.35pt'>
  <td height=20 class=xl81543 width=113 style='height:15.35pt;border-top:none;
  width:85pt'>Railway</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt'>10$/GB</td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>100GB</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl105543 style='border-top:none'>&nbsp;</td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td height=21 class=xl71543 width=113 style='height:16.0pt;width:85pt'>Northflank</td>
  <td class=xl99543 width=142 style='width:107pt'>0.3$/GB</td>
  <td class=xl97543 width=72 style='width:54pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>&#8734;</td>
  <td class=xl99543 width=94 style='width:71pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl100543>&nbsp;</td>
 </tr>
 <tr height=25 style='height:18.7pt'>
  <td colspan=5 height=25 class=xl90543 style='border-right:1.0pt solid black;
  height:18.7pt'>Virtual private servers</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=20 class=xl82543 width=113 style='height:15.35pt;border-top:none;
  width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Google
  Cloud</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Free e2-micro tier</td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>20GB</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl105543 style='border-top:none'>Access from Australia and China is
  not free</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=20 class=xl82543 width=113 style='height:15.35pt;border-top:none;
  width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Oracle</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Free E2.1 micro tier</td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Yes</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>High</td>
  <td class=xl105543 style='border-top:none'>&nbsp;</td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td height=21 class=xl72543 width=113 style='height:16.0pt;width:85pt'>VPS</td>
  <td class=xl99543 width=142 style='width:107pt'>1$ -&gt; ?</td>
  <td class=xl99543 width=72 style='width:54pt'>Yes</td>
  <td class=xl99543 width=94 style='width:71pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>High</td>
  <td class=xl100543>&nbsp;</td>
 </tr>
 <tr height=25 style='height:18.7pt'>
  <td colspan=5 height=25 class=xl93543 style='border-right:1.0pt solid black;
  height:18.7pt'>Hardware solutions</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=20 class=xl83543 width=113 style='height:15.35pt;border-top:none;
  width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Raspberry
  Pi</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Hardware</td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Yes</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>High</td>
  <td class=xl105543 style='border-top:none'>&nbsp;</td>
 </tr>
 <tr height=21 style='height:16.0pt;box-sizing: inherit;transition: background-color 125ms ease 0s;
  background-color:rgba(0, 0, 0, 0.035);box-shadow: 0 0.05rem 0 var(--md-default-bg-color) inset'>
  <td height=21 class=xl73543 width=113 style='height:16.0pt;width:85pt;
  box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Synology</td>
  <td class=xl99543 width=142 style='width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Hardware</td>
  <td class=xl99543 width=72 style='width:54pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>Yes</td>
  <td class=xl99543 width=94 style='width:71pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>High</td>
  <td class=xl100543>&nbsp;</td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=113 style='width:85pt'></td>
  <td width=142 style='width:107pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=94 style='width:71pt'></td>
  <td width=321 style='width:241pt'></td>
 </tr>
 <![endif]>
</table>
</div>


</body>

</br>

## Security and safekeeping

<head>
<style id="Book1_543_Styles"><!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
.xl65543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl66543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:white;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#404040;
	mso-pattern:black none;
	white-space:normal;}
.xl67543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:white;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	background:#404040;
	mso-pattern:black none;
	white-space:normal;}
.xl68543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:white;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	background:#404040;
	mso-pattern:black none;
	white-space:nowrap;}
.xl69543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:normal;}
.xl70543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:normal;}
.xl71543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:normal;}
.xl72543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:normal;}
.xl73543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:normal;}
.xl74543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:normal;}
.xl75543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:normal;}
.xl76543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:normal;}
.xl77543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:normal;}
.xl78543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:normal;}
.xl79543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:normal;}
.xl80543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCCCC;
	mso-pattern:black none;
	white-space:normal;}
.xl81543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:normal;}
.xl82543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:normal;}
.xl83543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:normal;}
.xl84543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:nowrap;}
.xl85543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:nowrap;}
.xl86543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:nowrap;}
.xl87543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:nowrap;}
.xl88543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:nowrap;}
.xl89543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:nowrap;}
.xl90543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:nowrap;}
.xl91543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:nowrap;}
.xl92543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:nowrap;}
.xl93543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:nowrap;}
.xl94543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:nowrap;}
.xl95543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:nowrap;}
.xl96543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl97543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl98543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl99543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl100543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl101543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:nowrap;}
.xl102543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:nowrap;}
.xl103543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:nowrap;}
.xl104543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl105543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl106543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl107543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl108543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"_\(\0022$\0022* \#\,\#\#0\.00_\)\;_\(\0022$\0022* \\\(\#\,\#\#0\.00\\\)\;_\(\0022$\0022* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl109543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\\ \[$€-1\]\;\[Red\]\\-\#\,\#\#0\\ \[$€-1\]";
	text-align:center;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl110543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"\0022$\0022\#\,\#\#0_\)\;\[Red\]\\\(\0022$\0022\#\,\#\#0\\\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
--></style>
</head>

- Do not use the same password for all your accounts, and choose passwords that are not easy to guess.
- Do not use the API_SECRET for the Atlas database password.
- Do not use your Dexcom or CareLink user name or password for Nightscout components.
- Do not share the API_SECRET or other passwords to your accounts to others.
- Do not use Nightscout or any related applications on rooted and/or otherwise compromised devices, and ensure you always have the latest operating system and virus protection updates installed.

If you want to read more about Nightscout security, including about additional configuration options to make your installation more secure, please check our [security guide](../security/).

</br>
