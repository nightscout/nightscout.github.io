# Nightscout in DigitalOcean

<span style="font-size:smaller;">**APPLIES TO:**</span> <img src="../../../vendors/img/DO.png" style="zoom:60%;" />

The original documentation is here [https://gist.github.com/DrCR77/eb08b830d4f31092cf65a8a9976dc0a6](https://gist.github.com/DrCR77/eb08b830d4f31092cf65a8a9976dc0a6).

!!!info "Cost"  
Nightscout and its database will fit in a Basic droplet at 6$ / month.  
You can test this solution for free for 2 months.  

Consider [Nightscout as a service](/#nightscout-as-a-service) as an option.

</br>

**WORK IN PROGRESS DO NOT USE**

<img src="../../../img/WIP.png" style="zoom:80%;" />

</br>

### Step 1: Create a GitHub account

</br>

If you already have a GitHub account, [update](../../../nightscout/github/#update-your-nightscout-fork) your Nightscout project.

If you don't have a GitHub account [create one](../../../nightscout/github/#create-a-github-account) then [fork the Nightscout project](../../../nightscout/github/#fork-the-nightscout-project) and come back.

</br>

### Step 2 - Create a Droplet

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

!!!warning "Do not use 22.04 as MongoDB is [not yet supported](https://www.mongodb.com/community/forums/t/installing-mongodb-over-ubuntu-22-04/159931/58) in this release"

<img src="../img/DO04.png" style="zoom:80%;" />

</br>

e) Select `SHARED CPU` `Basic` in `Choose a plan`.

<img src="../img/DO05.png" style="zoom:80%;" />

</br>

f) Change your Droplet plan to a `$4 Droplet`.  
You can modify this later but you can't select anything cheaper than this first choice.

<img src="../img/DO06.png" style="zoom:80%;" />

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

</br>

### Step 3 - Install MongoDB

a) Select twice your new droplet to open the view you see below, in `Access`, select  `Launch Droplet Console`.

<img src="../img/DO11.png" style="zoom:80%;" />

A terminal window will open.

<img src="../img/DO12.png" style="zoom:80%;" />

</br>

b) Update your Ubuntu system (this is a command you should type every 3 or 6 months to keep it updated).  
Enter the following command:

```bash
sudo apt-get update && apt-get upgrade -y
```

<img src="../img/DO13.png" style="zoom:80%;" />

You will see it's completed when the terminal stops scrolling text and you're returned to the prompt. Something like this:

<img src="../img/DO14.png" style="zoom:80%;" />

**If you see the following message: `*** System restart required ***` you will need to reboot**. Do not skip this step.

Type the following command and wait 5 minutes before opening again the console as in **a)** above.  
Your system will reboot after one minute after you enter the command. Wait.

```bash
shutdown -r
```

</br>

c) Install MongoDB entering the following command:

```bash
sudo apt install mongodb -y
```

Wait until it completes.

</br>

d) Enter in Mongo shell with the following command:

```bash
mongo --port 27017
```

<img src="../img/DO15.png" style="zoom:80%;" />

You will know you've entered the shell when the prompt is displayed: you will see `>`.

Enter

```
use admin
```

<img src="../img/DO16.png" style="zoom:80%;" />

</br>

e) We will create an admin user. Decide on a name and a password.  
Avoid reusing other usernames and passwords.
In the example below the user is `john_dbadmin` and the password `5t1ll5053cr3t!`.  
Do NOT use these examples for your database!

Now enter the user creation instruction. It will be made like this:  
**BUT** you need to **replace** `ADMIN_NAME` and `ADMIN_PASSWORD` with those you decided above!

```bash
db.createUser({user: "ADMIN_NAME", pwd: "ADMIN_PASSWORD", roles: [ { role: "userAdminAnyDatabase", db: "admin" }] })
```

Which gives for example:

<img src="../img/DO17.png" style="zoom:80%;" />

</br>

f) Exit the shell entering:

```bash
exit
```

Mongo will answer `bye` and you'll be back to Ubuntu's command prompt.

</br>

g) Edit your Mongo configuration typing:

```bash
sudo nano /etc/mongodb.conf
```

Nano text editor will open. Yes, that's the easiest way to edit text files in Linux. Don't complain else I'll make you use [vi](http://www.viemu.com/a-why-vi-vim.html).

<img src="../img/DO18.png" style="zoom:80%;" />

</br>

h) Using your keyboard arrows (no, your mouse doesn't work here), go down until you're on the line reading  `#auth = true` and remove the  `#`. 
<img src="../img/DO19.png" style="zoom:80%;" />

The line should now read:

<img src="../img/DO20.png" style="zoom:80%;" />

</br>

i) Save the modified file:

1. Press `Ctrl-O`    (the letter O not zero)
2. Press `Enter`
3. Press `Ctrl-X`

*Note: if you use a Mac the `Ctrl` key is `⌘`*

You can return to step **g.** above if you want to check it's been modified correctly.

</br>

Good. Now you know how to use Nano.

</br>

j) Restart Mongo with this command:

```bash
sudo service mongodb restart
```

Nothing special will display. You will return to the command prompt immediately.

</br>

You have installed the MongoDB application in your droplet.

</br>

### Step 4 - Create a new database

a) Login into Mongo as an admin typing this command:  
**BUT** you need to **replace** `ADMIN_NAME` with your own database administrator name, the one you decided above in **Step 3.e.**

```bash
mongo -u ADMIN_NAME -p --authenticationDatabase admin
```

You will be asked to enter the password matching your admin user (still that one defined in **Step 3.e**.).

This is the example continued, don't use `john_dbadmin` in your case: use your own.

<img src="../img/DO21.png" style="zoom:80%;" />

</br>

b) Now you need to create a database name.  
Make it simple (letters), this is just the place your Nightscout data will be stored.  
Type this command:  
**BUT** you need to **replace** `MONGO_NS_DB` with your own database name.

```bash
use MONGO_NS_DB
```

In the example below the database name is `NS-DB`.

<img src="../img/DO22.png" style="zoom:80%;" />

</br>

c) Then you need to create a database user. It's not the same than the Mongo user.  
Invent a name (letters and numbers) and a password (letters and numbers, uppercase and lowercase).

Type this command:  
**BUT** you need to **replace** `MONGO_NS_USER` with your database user name, `MONGO_NS_PASSWORD` with its matching password and `MONGO_NS_DB` with the database name you created above.

```bash
db.createUser({user: "MONGO_NS_USER", pwd: "MONGO_NS_PASSWORD", roles: [ { role: "readWrite", db: "MONGO_NS_DB" }]})
```

In the example below the database username is `john_nightscout`, the password is `Nightscout19800416` and database still `NS-DB`.

<img src="../img/DO23.png" style="zoom:80%;" />

</br>

d) Exit the shell entering:

```bash
exit
```

Mongo will answer `bye` and you'll be back to Ubuntu's command prompt.

</br>

e) Check you can login into Mongo with this user typing this command:  
**BUT** you need to **replace** `MONGO_NS_USER` with your own database administrator name, and replace `MONGO_NS_DB` with your own database name. The ones you decided above in **Step 3.c.**

```bash
mongo -u MONGO_NS_USER -p --authenticationDatabase MONGO_NS_DB
```

You will be asked to enter the password matching your user (the one defined in **Step 3.c**.).

This is the example continued, don't use `john_nightscout`: use your own.

<img src="../img/DO21.png" style="zoom:80%;" />

</br>

f) Exit the shell entering:

```bash
exit
```

Mongo will answer `bye` and you'll be back to Ubuntu's command prompt.

</br>

You have created your Nightscout MongoDB database and its user.

</br>

### Step 5 - Install Nightscout

a) Create a new user.  
You are now running Ubuntu with highest privilege. Don't try to run Nightscout as root user, it will not work.  
**Replace `mainuser`** with a name of your choice, like your name, only lowercase letters.

```bash
sudo adduser mainuser
```

In the example below, the user name is `john`.

<img src="../img/DO25.png" style="zoom:80%;" />

You need to invent a password for your new user.  
Confirm it then just hit `Enter` for the following lines, when done key `Y` then `Enter`.

<img src="../img/DO26.png" style="zoom:80%;" /> <!--  MyNightscout -->

</br>

b) Make your user an administrator.  
Type the following command:

**Replace `mainuser`** with your new user name.

```bash
sudo usermod -aG sudo mainuser
```

<img src="../img/DO27.png" style="zoom:80%;" />

</br>

c) Login to the machine using the account we just created.  
Type the following command:

**Replace `mainuser`** with your new user name.

```
sudo -u mainuser -s
```

In the example below, the user name is `john`.

<img src="../img/DO28.png" style="zoom:80%;" />

</br>

d) Install `nodejs` and `npm`.  
Type the following command:

```
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
```

<img src="../img/DO29.png" style="zoom:80%;" />

</br>

Once complete, type the following command:

```
sudo apt-get install -y nodejs
```

<img src="../img/DO30.png" style="zoom:80%;" />

</br>

e) Clone the Nightscout repository `cgm-remote-monitor`.  
Enter the following commands, one at a time, enter each time:

```
cd
```

```
git clone https://github.com/nightscout/cgm-remote-monitor.git
```

<img src="../img/DO32.png" style="zoom:80%;" />

```
ln -s cgm-remote-monitor nightscout
```

```
cd nightscout
```

<img src="../img/DO33.png" style="zoom:80%;" />

</br>

f) Install Nightscout.  
Type the following command:

```
npm install
```

<img src="../img/DO34.png" style="zoom:80%;" />

It will take a long time to complete. Be patient.

</br>

### Step 6 - Configure Nightscout

a) Edit the configuration file.

```bash
nano my.env
```

A text editor will open. Leave it like that for the moment.

<img src="../img/DO35.png" style="zoom:80%;" />

</br>

b) Identify your IP.  
Go back in your droplet settings and write down the `IPv4` information. You will need it in the form below for `BASE_URL`.

<img src="../img/DO36.png" style="zoom:80%;" />

</br>

c) Open the [**helper page**](../NightscoutVariablesUbuntu.html) in a new browser tab.

File all necessary fields, click on the Validate button at the bottom of the form, if no error is seen you will have all variables displayed in the text box at the bottom, click on the Copy All button.

d) Return to the text editor. Paste the result in `nano`.

<img src="../img/DO37.png" style="zoom:80%;" />

e) Save the modified file:

1. Press `Ctrl-O`    (the letter O not zero)
2. Press `Enter`
3. Press `Ctrl-X`

*Note: if you use a Mac the `Ctrl` key is `⌘`*

</br>

f) Install `pm2`.  
Type the following command:

```
sudo npm install pm2 -g
```

<img src="../img/DO38.png" style="zoom:80%;" />

</br>

g) Start cgm-remote-monitor with `pm2`.  
Type the following command:

```
env $(cat my.env)  PORT=1337 pm2 start server.js
```

<img src="../img/DO39.png" style="zoom:80%;" />

</br>

h) Make `pm2` start cgm-remote-monitor on startup.  

Type the following command:

```
pm2 startup
```

This will give you a command you need to run as superuser to allow pm2 to start the app on reboot.
The command will be something like: `sudo su -c "env PATH=$PATH:/usr/bin pm2 startup ..."`

Copy the tailored command, paste and execute it.

</br>

i) Save it.

```
pm2 save
```

Your Nightscout site is not available at http:// and the IP address you found in b) but it's not secured so most browsers will refuse it.

</br>

