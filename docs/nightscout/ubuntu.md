# Building your Nightscout site step by step in Ubuntu

</br>

**WORK IN PROGRESS DO NOT USE**

<img src="../../img/WIP.png" style="zoom:80%;" />

</br>

### Update your system

Update your Ubuntu system (you should type this is a command every 3 or 6 months to keep it updated).  
Enter the following command:

```bash
sudo apt update && sudo apt upgrade -y&& sudo apt clean
```

You will see it's completed when the terminal stops scrolling text and you're returned to the prompt. Something like this:

**If you see the following message: `*** System restart required ***` you will need to reboot**. Do not skip this step.

Type the following command and wait a minute before opening again the console.  

```bash
sudo reboot
```

</br>

### Step 1 - Install MongoDB in Ubuntu 20.04

If you use Ubuntu 22.04 skip this and continue [here](#step-1-install-mongodb-in-ubuntu-2204).

a) Install MongoDB entering the following command:

```bash
sudo apt install mongodb -y
```

Wait until it completes.

</br>

d) Enter in Mongo shell with the following command:

```bash
mongo --port 27017
```

You will know you've entered the shell when the prompt is displayed: you will see `>`.

Enter

```
use admin
```

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

</br>

h) Using your keyboard arrows (no, your mouse doesn't work here), go down until you're on the line reading  `#auth = true` and remove the  `#`. 
The line should now read:

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

### Step 1 - Install MongoDB in Ubuntu 22.04

If you use Ubuntu 20.04 skip this and continue to [Step 2](#step-2-create-a-new-database).

a) I:

```bash

```

Wait .

</br>

### Step 2 - Create a new database

a) Login into Mongo as an admin typing this command:  
**BUT** you need to **replace** `ADMIN_NAME` with your own database administrator name, the one you decided above in **Step 3.e.**

```bash
mongo -u ADMIN_NAME -p --authenticationDatabase admin
```

You will be asked to enter the password matching your admin user (still that one defined in **Step 3.e**.).

This is the example continued, don't use `john_dbadmin` in your case: use your own.

</br>

b) Now you need to create a database name.  
Make it simple (letters), this is just the place your Nightscout data will be stored.  
Type this command:  
**BUT** you need to **replace** `MONGO_NS_DB` with your own database name.

```bash
use MONGO_NS_DB
```

In the example below the database name is `NS-DB`.

</br>

c) Then you need to create a database user. It's not the same than the Mongo user.  
Invent a name (letters and numbers) and a password (letters and numbers, uppercase and lowercase).

Type this command:  
**BUT** you need to **replace** `MONGO_NS_USER` with your database user name, `MONGO_NS_PASSWORD` with its matching password and `MONGO_NS_DB` with the database name you created above.

```bash
db.createUser({user: "MONGO_NS_USER", pwd: "MONGO_NS_PASSWORD", roles: [ { role: "readWrite", db: "MONGO_NS_DB" }]})
```

In the example below the database username is `john_nightscout`, the password is `Nightscout19800416` and database still `NS-DB`.

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

</br>

f) Exit the shell entering:

```bash
exit
```

Mongo will answer `bye` and you'll be back to Ubuntu's command prompt.

</br>

You have created your Nightscout MongoDB database and its user.

</br>

### Step 3 - Install Nightscout

a) Create a new user.  
You are now running Ubuntu with highest privilege. Don't try to run Nightscout as root user, it will not work.  
**Replace `mainuser`** with a name of your choice, like your name, only lowercase letters.

```bash
sudo adduser mainuser
```

In the example below, the user name is `john`.

You need to invent a password for your new user.  
Confirm it then just hit `Enter` for the following lines, when done key `Y` then `Enter`.

 <!--  MyNightscout -->

</br>

b) Make your user an administrator.  
Type the following command:

**Replace `mainuser`** with your new user name.

```bash
sudo usermod -aG sudo mainuser
```

</br>

c) Login to the machine using the account we just created.  
Type the following command:

**Replace `mainuser`** with your new user name.

```
sudo -u mainuser -s
```

In the example below, the user name is `john`.

</br>

d) Install `nodejs` and `npm`.  
Type the following command:

```
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
```

</br>

Once complete, type the following command:

```
sudo apt-get install -y nodejs
```

</br>

e) Clone the Nightscout repository `cgm-remote-monitor`.  
Enter the following commands, one at a time, enter each time:

```
cd
```

```
git clone https://github.com/nightscout/cgm-remote-monitor.git
```

```
ln -s cgm-remote-monitor nightscout
```

```
cd nightscout
```

</br>

f) Install Nightscout.  
Type the following command:

```
npm install
```

It will take a long time to complete. Be patient.  
On some lightweight virtual computers install might fail or hang, you can try another time `npm install`.

</br>

### Step 4 - Configure Nightscout

a) Edit the configuration file.

```bash
nano my.env
```

A text editor will open. Leave it like that for the moment.

</br>

b) Identify your IP.  
Go back in your droplet settings and write down the `IPv4` information. You will need it in the form below for `BASE_URL`.

</br>

c) Open the [**helper page**](../NightscoutVariablesUbuntu.html) in a new browser tab.

File all necessary fields, click on the Validate button at the bottom of the form, if no error is seen you will have all variables displayed in the text box at the bottom, click on the Copy All button.

d) Return to the text editor. Paste the result in `nano`.

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

</br>

g) Start cgm-remote-monitor with `pm2`.  
Type the following command:

```
env $(cat my.env)  PORT=1337 pm2 start server.js
```

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

Your Nightscout site is now available at http:// and the IP address you found in b) but it's not secured so most browsers will refuse it.

</br>
