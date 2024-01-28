# Advanced Nightscout deployments

</br>

```{admonition} Too complicated? Not what you're looking for?
:class: seealso
Consider a hosted Nightscout service! Check for easier solutions [here](/index.md#nightscout-as-a-service).
```

</br>

## Building Nightscout DIY in a cloud platform

You can run your Nightscout site in several vendors platforms, using free or paid accounts.  

We documented Heroku, Azure, Railway, Northflank and Fly.io. There are probably others, don't hesitate to [open an issue in the documentation](https://github.com/nightscout/nightscout.github.io/issues) with the easiest deployment method if you want to see them named here.

</br>

## Building Nightscout DIY in a virtual server

You can run your Nightscout site in physical or virtual private servers, using free or paid accounts.  
The [original](https://github.com/jasoncalabrese/project-glu/blob/master/README.md) Nightscout project was also developed to run in Digital Ocean.

You can use step by step Linux commands or deploy with a **simple** scripted install.

Below is a list of some VPS. There are probably others, don't hesitate to [open an issue in the documentation](https://github.com/nightscout/nightscout.github.io/issues) with the easiest deployment method if you want to see them named here.

[Google Cloud](https://navid200.github.io/xDrip/docs/Nightscout/GoogleCloud.html) with a Scripted deployment (one command).  
[Oracle](https://www.dropbox.com/s/5twlqrndofqno0t/0-amber-oracle.pdf)  and extensive documentation (npm and Docker).  
[Amazon Web Service](https://github.com/rajdeut/terraform-aws-nightscout#readme)

Some common deployment methods:

[Ubuntu](/vendors/VPS/ubuntu) commands.  
[Docker](/vendors/VPS/docker) container.

</br>

(nas)=

## Building Nightscout inside your NAS

Don't buy a NAS device just for this, but if you already have one that's worth a try!

You can host your Nightscout site in your [Synology](/vendors/NAS/synology) NAS.  
You can also try with your [QNAP](https://docs.google.com/document/d/1zpF6Y3kPQqc9KOsClIQt686HDLhGfFxwz4vGfq8E254/edit) NAS.

</br>

## Building Nightscout with a Raspberry PI 4

If you own one, you can use it to host your Nightscout, see [here](https://gist.github.com/Andries-Smit/daac75cd4c06af78cde68c5dec941705). 

</br>

## Home Assistant Add-On for Nightscout

This add-on is a wrapper around nightscout/cgm-remote-monitor. It includes a Mongo Database which is used to store the uploaded values.

See [here](https://github.com/marciogranzotto/addon-nightscout).

</br>
