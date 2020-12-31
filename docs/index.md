![](.\img\cropped-Header3.png)

# Welcome to Nightscout

</br>
 <img src="./img/nightscout_screenshot_600.png" width="600px">
</br>
</br>

## Introduction

**Nightscout** (also known as **"CGM in the Cloud"**) is an open-source cloud application **used by people with diabetes** to visualize, store and share the data from their **Continuous Glucose Monitoring** sensors in real-time. Once setup, Nightscout acts as a central repository of blood glucose and insulin dosing/treatment data for a single person, allowing you to view the CGM graph and treatment data anywhere using just a web browser connected to the internet.

The Nightscout cloud application can be installed by yourself using free hosting services from various cloud service providers. 

Although not necessary, you might prefer to use paid hosting services for your database (to avoid future maintenance tasks) or indeed pay to use a fully-managed Nightscout hosting service to avoid having to personally build and maintain your site yourself.

The CGM data is usually sent to Nightscout by an uploader device (known as a **"Master"**) such as a mobile/cellphone running an app such as xDrip+, Spike, xDrip4iOS or Medtronic Uploader. Alternatively, the CGM data can be pulled directly from your online Dexcom or Medtronic CareLink accounts. The application you'll need for uploading the data depends on which CGM device you're using and what type of mobile device you have.

In addition to viewing the data using a web browser, there are also applications available for mobile devices, smartwatches, electronic devices and other cloud-based services which allow you alternative ways to view and interact with the information stored within your Nightscout site (often known as **"Followers"**).

<img src="./img/nscloud.png" width="800px">

</br>
## Development History

Nightscout was developed by parents of children with Type 1 Diabetes and has continued to be developed, maintained, and supported by volunteers. When first implemented, Nightscout was a solution specifically for remote monitoring of Dexcom G4 CGM data.

Today, there are Nightscout solutions available for nearly all commercial CGM sensors. The goal of the project is to allow the remote monitoring, sharing and analysis of a T1D's glucose levels using existing monitoring devices.
</br>
</br>

## What Do I Need?

You really don't need to much to get Nightscout up and running but let's start with the basics.

Are you sitting comfortably? Then let's begin.

You will need:

-   A CGM sensor: Dexcom, Medtronic, Libre (plus an additional transmitter) or Eversense

-   A way to [upload](./uploader/uploaders.md) your data (this is generally an internet-connected mobile phone with a matching uploader app)

-   Internet access

-   1 hour of "quiet" time (a <s>beer</s> nice cup of coffee is optional but highly recommended)

-   Basic computer skills and the ability to ***carefully*** follow the installation guides shown on this site

    ***"Carefully"** means that you will thoroughly read, follow and complete each step without skipping any and without giving up thinking that it is too difficult - it isn't, you just need to be patient.*
 
</br>
!!!warning "IMPORTANT"
    Before using Nightscout, it is important to understand that this project:

    - is a open-source, community-based project and is not supported by any company
    - is not officially approved or regulated for diabetes therapy and/or treatment in any way

    **You must understand that you take full responsibility for building and running this system and you agree to do so at your own risk.**

!!!warning "SAFETY"
    - This project requires a working internet connection and availability of third party cloud services
    - Do not rely only on Nightscout as the only way you have of knowing your blood glucose values and trends
    - Make sure you're ready to cope with an unexpected failure and always have alternative ways to check your blood glucose levels
</br>

## How Much Does It Cost?

Nightscout has essentially always been a completely free sevice to install and use. The installation instructions take advantage of free accounts from cloud service providers to install and run the application. In late 2020 some of these services changed slightly and this caused some extra work to make them suitable for running Nightscout.

It is still perfectly feasible to build your Nightscout site and operate it **entirely for free**, you just need to be aware that you might experience some limitations which are easily managed using the tools available within the Nightscout "Admin Tools" page.

Free databases like the Altas M0 Sandbox provided by [MongoDB](https://www.mongodb.com/) will hold a limited amount of data (512MB) and you may eventually need to delete old records (maybe every 3-4 years with standard Nightscout CGM useage). You can increase even further the database capacity to 2GB/5GB by paying for an M2/M5 Shared Cluster if you wish.

Application servers such as [Heroku](https://www.heroku.com/)'s "Free" plan will provide enough server hours to run a single Nightscout site without any downtime. If you need to run several sites on the same account, you can easily upgrade to a paid "Hobby" plan. 

Finally, if you prefer to avoid any manual set-up, configuration and maintenance tasks, then you can also opt for a paid and fully-managed Nightscout hosting service.
</br>
</br>

## Who Can Help Me?

You will find many willing and open-hearted people in the Facebook groups. 

The main group for all Nightscout support is the "[CGM In The Cloud](https://www.facebook.com/groups/cgminthecloud/)" Facebook group.

There are also many local Nightscout communities and you'll probably be able to find one in your own country and language if this helps.

!!!warning "Technical Support"
    This project is often considered "**Do It Yourself**" (DIY) and supported by volunteers. Whilst you will almost certainly always will find someone ready to help you for free, building your own Nightscout site **doesn't entitle you to any form of support** from anybody.
    
    The open-source diabetes movement is founded on the idea of **paying it foward** and helping others to learn things that others took their time to help teach you about.

    *Ask nicely, and nice people will always do nice things and help you.*
    
    Nightscout developers are busy people and we'd like them to concentrate on maintaining and improving Nightscout, not only supporting users. (This means **do not** send them private messages or friend requests just to help fix something that is already clearly documented or for help that can be easily requested in the CGM In The Cloud group)

!!!info "Facebook Privacy"
    You'll find a lot of useful and friendly diabetes-oriented groups on Facebook and it's probably the best place to find online support. Some people express concerns about using Facebook: if you're worried about your privacy just remember Facebook will only share the information that you **allow** it to share.
</br>

## Paid Solutions

If you prefer to pay and just use Nightscout as a fully managed service and let somebody else worry about installation and maintenance then [T1Pal](https://t1pal.com/) could be exactly what you need.

The T1Pal hosting service has been developed by **Ben West**, a member of the original CGM in the Cloud team and an original lead core developer for the Nightscout Project.
</br>
</br>

## How to Use These Docs

* Use the navigation menu at the top of the screen to find the section that you are looking for.

* A Table of Contents for the current page is always displayed on the left side of the screen.

* You can search the Nightscout Docs site by clicking the Search icon at the top of every page:

    <img src="img/search_icon_screenshot.png" width="254px"> 

</br>

## How Can I Help?

You'll find the source repository for this documentation [here](https://github.com/nightscout/nightscout.github.io). Please don't hesitate to improve or correct anything you see and create a pull request!

You're also welcome to contribute or report any error, unclear explanation, typo, broken link etc by going to Github and opening an [issue](https://github.com/nightscout/nightscout.github.io/issues).

Finally, to help on the development of Nightscout itself, feel free to join in at our [Discord Channel](https://discord.gg/zg7CvCQ).