# Building Nightscout in Ubuntu

</br>

```{tip}
<span style="font-size:larger;">The most complete guide for building your site step by step is the one used for [Oracle Cloud](https://www.dropbox.com/s/5twlqrndofqno0t/0-amber-oracle.pdf).  
If you use another hosting provider, skip Oracle specific instructions and follow the flow.</span>
```

</br>

Deploying in Ubuntu is very popular for skilled people, see also [here](https://gist.github.com/DrCR77/eb08b830d4f31092cf65a8a9976dc0a6) and [here](https://www.michael-schloemp.de/2021/10/25/nightscout-installation-auf-ubuntu-20-04-1blu-vps/).</br>

If you don't own a domain, get one now, see [here](/nightscout/dns).

</br>

## Update your system

Update your Ubuntu system (you should type this is a command every 3 or 6 months to keep it updated).

```bash
sudo apt update
sudo apt upgrade -y
sudo apt clean
```

You will see it's completed when the terminal stops scrolling text and you're returned to the prompt.

**If you see the following message: `*** System restart required ***` you will need to reboot**. Do not skip this step: reboot and wait a minute before opening again the console.  

```bash
sudo reboot
```

You must probably already have nano installed. If necessary:

```bash
sudo apt install nano -y
```

</br>

## Step 1 - Install MongoDB

a) Follow the vendor instructions

[MongoDB 5 with Ubuntu 20.04](https://www.mongodb.com/docs/v5.0/tutorial/install-mongodb-on-ubuntu/) or [MongoDB 6 with Ubuntu 22.04](https://www.mongodb.com/docs/v6.0/tutorial/install-mongodb-on-ubuntu/)

b) Enter in Mongo shell

```bash
mongo --port 27017
```

You will know you've entered the mongo shell when the prompt `>` is displayed.

c) Create an admin user. Decide on a name and a password.  
Avoid reusing other usernames and passwords.

Replace `ADMIN_NAME` and `ADMIN_PASSWORD` with those your own. Keep all `" "`.

```
use admin
```

```bash
db.createUser({user: "ADMIN_NAME", pwd: "ADMIN_PASSWORD", roles: [ { role: "userAdminAnyDatabase", db: "admin" }] })
```

Exit mongo.

```bash
exit
```

Mongo will answer `bye` and you'll be back to Ubuntu's command prompt.

</br>

d) Turn Mongo security on

```bash
sudo nano /etc/mongodb.conf
```

Go to the line reading  `#auth = true` and remove the comment  `#`. 
Save the modified file:

1. Press `Ctrl-O`    (the letter O not zero)
2. Press `Enter`
3. Press `Ctrl-X`

*Note: if you use a Mac the `Ctrl` key is `⌘`*

e) Restart Mongo with this command:

```bash
sudo service mongodb restart
```

You have installed the MongoDB application.

</br>

## Step 2 - Create a new database

a) Login into Mongo as an admin  
**Replace** `ADMIN_NAME` with your own database administrator name.

```bash
mongo -u ADMIN_NAME -p --authenticationDatabase admin
```

You will be asked to enter the password matching your admin user.

b) Create a database name.  
Make it simple (letters), this is just the place your Nightscout data will be stored.
**Replace** `MONGO_NS_DB` with your own database name.

```bash
use MONGO_NS_DB
```

c) Create a database user.  
Invent a name (letters and numbers) and a password (letters and numbers, uppercase and lowercase).
**Replace** `MONGO_NS_USER` with your database user name, `MONGO_NS_PASSWORD` with its matching password and `MONGO_NS_DB` with the database name you created above.

```bash
db.createUser({user: "MONGO_NS_USER", pwd: "MONGO_NS_PASSWORD", roles: [ { role: "readWrite", db: "MONGO_NS_DB" }]})
```

Exit the shell

```bash
exit
```

d) Check you can login into Mongo with this user  
**Replace** `MONGO_NS_USER` with your own database administrator name, and replace `MONGO_NS_DB` with your own database name.

```bash
mongo -u MONGO_NS_USER -p --authenticationDatabase MONGO_NS_DB
```

You will be asked to enter the password matching your user.

Exit the shell.

```bash
exit
```

You have created your Nightscout MongoDB database and its user.

</br>

## Step 3 - Install Nightscout

a) Create a new  user.  
Don't try to run Nightscout as root, it will not work.  
**Replace `mainuser`** with a name of your choice, like your name, only lowercase letters.

```bash
sudo adduser mainuser
```

You need to invent a password for your new user.  
Confirm it then just hit `Enter` for the following lines, when done key `Y` then `Enter`.

 b) Make your user an administrator.

**Replace `mainuser`** with your new user name.

```bash
sudo usermod -aG sudo mainuser
```

c) Login to the machine using the account we just created.

!!!warning "Do not run Nightscout as root"  
    From now on use your Nightscout user.

**Replace `mainuser`** with your new user name.

```
sudo -u mainuser -s
```

d) Install `nodejs` and `npm`.

**Mind some small VPS will not be powerful enough to deploy with npm, consider using a [Docker container](/vendors/VPS/docker) in this case.**

The example below is with the **latest supported npm version**: 16.20.1

```
sudo apt install nodejs
sudo apt install build-essential checkinstall
sudo apt install libssl-dev
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
source /etc/profile
nvm install 16.20.1
nvm use 16.20.1
```

Once complete, install npm

```
sudo apt-get install -y npm
```

</br>

e) Clone the Nightscout repository `cgm-remote-monitor`.

```
cd
git clone https://github.com/nightscout/cgm-remote-monitor.git
ln -s cgm-remote-monitor nightscout
cd nightscout
```

```{admonition} Make sure you're in your nightscout directory
:class: warning
Should you exit your terminal and resume working later make sure to return to this state.  
    1- you're using your nightscout user  
    2- you are in your nightscout directory
```

f) Install Nightscout.

```
npm install
```

It will take a long time to complete. Be patient.  
On some lightweight virtual computers install might fail or hang, especially if you installed the default latest node.js version.  
You can try to interrupt and run another time `npm install`.

</br>

## Step 4 - Configure Nightscout

a) Edit the configuration file.

```bash
nano my.env
```

You can use the [**helper page**](/_static/NightscoutVariablesUbuntu.html) in a new browser tab.

File all necessary fields, click on the Validate button at the bottom of the form, if no error is seen you will have all variables displayed in the text box at the bottom, click on the Copy All button.

```{admonition} Variables format
:class: tip
1- do not add`export` before the variable name  
2- safe format is `VARIABLE="value"`  
3- all spaces in the values must be replaced by `%20`
```

b) Return to the text editor. Paste the result in `nano`.

c) Save the modified file:

1. Press `Ctrl-O`    (the letter O not zero)
2. Press `Enter`
3. Press `Ctrl-X`

*Note: if you use a Mac the `Ctrl` key is `⌘`*

</br>

### Manage Nightscout startup

d) Install `pm2`

```
sudo npm install pm2 -g
```

e) Start cgm-remote-monitor with `pm2`.

```
env $(cat my.env)  PORT=1337 pm2 start server.js
```

f) Make `pm2` start cgm-remote-monitor on startup

```
pm2 startup
```

This will give you a command you need to run as superuser to allow pm2 to start the app on reboot.
The command will be something like: `sudo su -c "env PATH=$PATH:/usr/bin pm2 startup ..."`

Copy the tailored command, paste and execute it.

g) Save it.

```
pm2 save
```

Your Nightscout site is now available at `http://` and the IP address of your computer/VPS but it's not secured so most browsers will refuse it.

</br>

## Step 5 - Open and secure your access

a) Create a reverse [nginx](https://nginx.org/en/) proxy

```
sudo apt-get install nginx
```

b) Delete and replace the original `/etc/nginx/sites-available/default` with this one.  
**Replace `MY_FULLYQUALIFIEDNAME`** with your own (it will look like `name.domain.tld`). You don't have one? Look [here](/nightscout/dns/).

```
server {
	listen 80;
	server_name MY_FULLYQUALIFIEDNAME;
	location / {
		proxy_pass http://127.0.0.1:1337;
		proxy_http_version 1.1;
		proxy_set_header Upgrade $http_upgrade;
		proxy_set_header Connection 'upgrade';
		proxy_set_header Host $host;
		proxy_cache_bypass $http_upgrade;
		proxy_set_header X-Forwarded-Proto "https";
	}
}
```

Your Nightscout site is now available at `http://MY_FULLYQUALIFIEDNAME` but it's not secured so most browsers will refuse it.

c) If your VPS doesn't provide a firewall you should install and configure ufw.  
**Make sure to open ssh if you don't have KVM access!**

```
sudo apt install ufw
sudo ufw allow 'Nginx Full'
sudo ufw allow OpenSSH
sudo ufw enable
```

d) Obtain a certificate for your site name.

```
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d "MY_FULLYQUALIFIEDNAME" --redirect --agree-tos --no-eff-email
```

You can increase ssl security with a strong Diffie-Hellman group ([src](https://gist.github.com/johnmales/1b3c927f2a56aae640b4b2cd0298b1e7)):

```
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
```

e) Make sure certbot takes care of renewing your certificate:

```
sudo certbot renew --dry-run
```

f) Restart the service:

```
sudo service nginx restart
```

Upon success you will be able to access your Nightscout site from any browser using `https://`.
