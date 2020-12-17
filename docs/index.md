![](.\img\cropped-Header2.png)

</br>

# Welcome to Nightscout

</br>

## Introduction

Nightscout (CGM in the Cloud) is an open source cloud application, which you can install yourself using free hosting from various cloud service providers. You might also need or prefer to use paid hosting services for your database size needs or to avoid the difficulties in building and maintaining your site. Once setup, Nightscout acts as a central repository of blood glucose and insulin dosing data for a single person, allowing you to view the CGM graph and other data anywhere using a web browser.

The CGM data is sent to Nightscout using an uploader application such as xDrip+, Spike or Medtronic uploader, running on a mobile phone carried by the person being monitored, or directly from your Dexcom or CareLink account. The application you'll need for uploading the data depends on which CGM device you're using.

In addition to viewing the data using a web browser, there are several applications available for mobile devices and smart watches, which allow you alternate ways to view the information.

</br>

<img src="./img/nscloud.png" width="800px">

</br>

Once you have Nightscout up and running, you'll get a view that looks something like this:

</br>

 <img src="./img/nightscout.jpg" width="600px">

</br>

</br>

!!!warning "IMPORTANT"

    Please understand that this project:
    
    - Is highly experimental
    - Is not approved for therapy
    
      **You take full responsibility for building and running this system and do so at your own risk.**

</br>

!!!warning "SAFETY"

    This project requires internet availability and third party cloud services availability.
    
    - Do not rely only on it
    - Make sure you're ready to cope with an unexpected failure
    
      **You are building your own Nightscout site and will be sole responsible for its functioning and its use.**

</br>

## Development History

Nightscout was developed by parents of children with Type 1 Diabetes and has continued to be developed, maintained, and supported by volunteers. When first implemented, Nightscout was a solution specifically for remote monitoring of Dexcom G4 CGM data. Today, there are Nightscout solutions available for many CGM sensors. The goal of the project is to allow remote monitoring of a T1D’s glucose level using existing monitoring devices.

</br>

## What Does It Cost?

Cost varies based on the setup you will need.

You can build your Nightscout site and operate it **entirely for free but you might experience some limitations.**

Keep in mind free hosting services will require you to maintain them.

Free databases like M0 Sandbox provided by Atlas will only hold a limited amount of data (512MB) and you may eventually need to manually cleanup. You can extend the capacity to 2 and 5GB paying an M2 or M5 Shared cluster.

Heroku Free dynos plan will not prevent your app to fall asleep in certain cases and you might need to setup an Uptime robot to prevent this. You can also make it always available upgrading to a Hobby plan. 

You can opt for a paid service if you prefer.

</br>

## What Do I Need?

A CGM sensor: Dexcom, Medtronic, Libre (plus an additional transmitter) or Eversense.

An [uploader](./uploader/uploaders.md): a mobile phone with the matching app.

Internet access.

Basic skills in using a computer and following a procedure.

</br>

## Who Will Help Me?

You will find open heart people in Facebook groups, there are many Nightscout communities and most probably you'll find one in your own country and language.

Main Facebook group: [https://www.facebook.com/groups/cgminthecloud/](https://www.facebook.com/groups/cgminthecloud/)

!!!note
    You'll find a lot of useful diabetes oriented groups on Facebook and it's probably the best place to find online support. Some people express concerns about using Facebook: if you're worried about your privacy just remember Facebook will only share the information **you** want to share. It will not prevent you from creating a neutral account without any private information and use it only to access these groups.

!!!warning "Regarding support"

    This project is DIY and supported by volunteers. Whilst you most probably will find someone ready to help for free, building your own Nightscout site doesn't entitle you to any form of support.
    
    Nightscout developers are busy people and we'd like them to concentrate on maintaining and improving Nightscout, not only supporting users.

</br>

## I would prefer to pay someone else to manage it for me...

Then [T1Pal](https://t1pal.com/) is what you need.

T1Pal has been designed by Ben West, a member of the original CGM in the Cloud team and a an original lead core developer for the Nightscout Project.

</br>

## How to Use These Docs

* Use the navigation menu at the top of the screen to find the info you are looking for.
* A Table of Contents for the current page is always displayed on the left side of the screen.
* You can search the Nightscout Docs site by clicking the <img src="img/search_icon.png" width="50px"> icon.

</br>

## Feedback on this documentation

You'll find the source repository here [https://github.com/nightscout/nightscout.github.io](https://github.com/nightscout/nightscout.github.io), don't hesitate to create a pull request!

You're welcome to contribute or report any error, unclear explanation, typos, broken links, ... by opening an [issue](https://github.com/nightscout/nightscout.github.io/issues) in GitHub.