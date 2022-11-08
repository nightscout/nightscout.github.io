# Nightscout in DigitalOcean

<span style="font-size:smaller;">**APPLIES TO:**</span> <img src="../../../vendors/img/DO.png" style="zoom:60%;" />

The original documentation is here [https://gist.github.com/DrCR77/eb08b830d4f31092cf65a8a9976dc0a6](https://gist.github.com/DrCR77/eb08b830d4f31092cf65a8a9976dc0a6).

!!!info "Too complicated? Not what you're looking for? Consider a hosted Nightscout service! Check for easier solutions [here](../../#nightscout-as-a-service)."  
<span style="font-size:larger;">Interested in building a Nightscout DIY site?  Make sure you **read and understand [this](/#how-much-does-it-cost)** before starting.</span>

</br>

**Pros**:  

> Reliable platform  
> Well known by the community IT specialists  

**Cons**:  

> Smallest Droplet at 4$/month

</br>

### Create a Droplet

a) Sign up at [DigitalOcean](https://www.digitalocean.com/) and `Sign up with GitHub`.

<img src="../img/DO01.png" style="zoom:80%;" />

</br>

b) Authorize DigitalOcean to access GitHub information.

<img src="../img/DO02.png" style="zoom:80%;" />

</br>

c) Select `Deploy a virtual machine`.

<img src="../img/DO03.png" style="zoom:80%;" />

</br>

d) Select `Ubuntu 20.04 (TLS) x64` using the drop down menu.

!!!info "22.04 (TLS) x64"  
    You can use 22.04 but MongoDB is [not yet supported](https://www.mongodb.com/community/forums/t/installing-mongodb-over-ubuntu-22-04/159931/58) in this release.  
    If you deploy manually that won't be an issue, but scripted install is now only for 20.04.

<img src="../img/DO04.png" style="zoom:80%;" />

</br>

e) Select `SHARED CPU` `Basic` in `Choose a plan`.

<img src="../img/DO05.png" style="zoom:80%;" />

</br>

f) Change your Droplet plan to a `$4 Droplet`.  
You can modify this later but you can't select anything cheaper than this first choice.

<img src="../img/DO06.png" style="zoom:80%;" />

***Note:** For a reliable Nightscout a $6 Droplet is recommended.*

</br>

g) Choose a datacenter close to where you live.

<img src="../img/DO24.png" style="zoom:80%;" />

</br>

h) It is strongly recommended that you select `SSH Key` to have a secure login.  
If you're not technical enough you will probably want to use a standard `root` password. If you decide to do so, make sure it's highly complex and change it regularly to avoid your site being hacked.

<img src="../img/DO07.png" style="zoom:80%;" />

</br>

g) Scroll down and click `Create`.

<img src="../img/DO09.png" style="zoom:80%;" />

Wait until your droplet finishes initialization.

</br>

h) You need to confirm your identity with a credit card or with PayPal.  
If you selected a credit card, 5$ will be booked on it: not withdrawn.

<img src="../img/DO08.png" style="zoom:80%;" />

You now have 100$ to spend for free for the next 60 days.

</br>

### Access your VPS

Select twice your new droplet to open the view you see below, in `Access`, select  `Launch Droplet Console`.

<img src="../img/DO11.png" style="zoom:80%;" />

A terminal window will open.

<img src="../img/DO12.png" style="zoom:80%;" />

</br>

### Deploy Nightscout

You can use several methods to deploy your Nightscout site:

[Manually](../../../nightscout/ubuntu), command by command.

Using a [deployment script](../../../nightscout/xdripteam).

Using a [Docker](../../../nightscout/docker) container.

</br>

