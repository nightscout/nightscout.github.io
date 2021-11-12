# DIY Nightscout Components

</br>

Components, costs and complexity will depend on the solution you want to implement.

For an overview of some possibilities, see [vendors](../../vendors).

</br>

------

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/Heroku.png" style="zoom:80%;" /> + <img src="../../vendors/img/Atlas.png" style="zoom:80%;" />

------

</br>

## GitHub

<img src="https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png" style="zoom:20%;" />

**[GitHub](https://github.com/about)** is a Git repository hosting service.

It's a place where you can store and share projects: software, hardware, documentation (and virtually anything)  and maintain versions of your work. It allows collaboration between developers (anybody can view the complete code of Nightscout: it is open source) and anybody can download it or make a copy of it (a **"fork"**). A GitHub project is available in a repository (also called repo) like the [Apollo 11 source code](https://github.com/chrislgarry/Apollo-11) and Nightscout [https://github.com/nightscout/cgm-remote-monitor](https://github.com/nightscout/cgm-remote-monitor).

</br>

## Heroku

![https://brand.heroku.com/static/media/heroku-logo-stroke.aa0b53be.svg](https://brand.heroku.com/static/media/heroku-logo-stroke.aa0b53be.svg)

[**Heroku**](https://www.heroku.com/about) is a container-based cloud Platform as a Service.

It's an infrastructure where you can run your application (your program) in the cloud, meaning that you don't need to have specific hardware (servers, hardware, infrastructures) and it is available from anywhere when connected to the internet, usually as a web page with an address like https://mynightscoutsite.herokuapp.com. Your Nightscout app will run in the Heroku cloud and will be available to any device connected to the internet and knowing the address. You can also secure it and decide who can see your BG.

</br>

## mongoDB

<img src="https://webassets.mongodb.com/_com_assets/cms/MongoDB_Logo_FullColorBlack_RGB-4td3yuxzjs.png" style="zoom:10%;" />

[**mongoDB**](https://www.mongodb.com/what-is-mongodb) is a document database.

It's a virtual place where you can store your data, in the cloud like Heroku. Nightscout will store all your data in an Atlas database: your BG, insulin sensitivity factors, correction factors, basal profiles, etc... This will allow Nightscout to create reports and much more.

</br>

# Nightscout install

</br>

In order to create a new Nightscout site you'll need to open an account in each of the previous providers.

The **GitHub** account will allow you to copy (fork) the original source code in your own cgm-remote-monitor repository, which includes the install (deploy) and update scripts as well as the rest of the functions that make Nightscout. You can see it as the software code of Nightscout, a set of instructions.

The **Heroku** account creation will require you to provide a valid credit card to certificate you are a physical person and not an automated system. Unless you deliberately choose a paid option (and there is no trap: you won't be able to select one by mistake) you will not be billed anything. You can see Heroku as the engine of your Nightscout, the application itself, that's running somewhere on the internet and can be accessed from anywhere.

The **Atlas** account will give you access to a small free database (500MB) that should be more than enough for most users. If uploading from a 600 series pump, or if using a DIY close loop system, it might be small and you'll need regular cleanup.

<img src="..\img\insight01.png" style="zoom:80%;" />

</br>

# Nightscout operation

</br>

During normal operation, your uploader (a device connected to your CGM and the internet) will send data to Nightscout, and Heroku will place them in the database. The values or predicted values might trigger some actions with other devices that are connected to Nightscout (like IFFT). You will be able to access them near real-time from any device connected to the internet like a computer, mobile phone with a browser or a follower app, various gadgets connected to internet, smartwatches, ...

<img src="..\img\insight02.png" style="zoom:80%;" />