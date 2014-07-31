---
title: Monitor CGM on the web
layout: guide
pageOrder: 7
tags: 
  - guide
  - quickstart
  - post
published: true
---

### Microsoft Azure – cloud service to host website free
  * [Sign into Github.com](https://github.com/) with a free account.
  * [![fork](http://i.imgur.com/gR4wJ24.png) the cgm-remote-monitor](https://github.com/nightscout/cgm-remote-monitor/fork)

  * Visit http://azure.microsoft.com
  * Click “Try for free”
  * Enter or create username: `_________` (e.g. sally@outlook.com)
  * Enter or create password: `_________`
  * Enter credit card information (will not be billed, ever, without
    your permission)  
  * Go to the [Azure Portal](https://manage.windowsazure.com)
      Create a new Azure site
  * Choose a Site Name: `_________` `.azurewebsites.net`
    (e.g. **`nightscoutss`**`.azurewebsites.net`)
  * Configure connection strings
    
    FIrst, find and click on the configure tab at the top of the page.
    ![go to configure tab](http://i.imgur.com/dIPRHjt.png)

    Next, scroll down the page until you find the **connection strings** (it will be over three quarters of the way down the page.  You will see this:
    ![connection strings](http://i.imgur.com/PZjxkjE.png)

    Create two rows.  At the end of each row, it will initially say SQL 	Database.  Click on the arrow and select **Custom**  for both rows.  You now have two new **Custom** rows.  
    
    Each row now needs a name and a value.
    
    Name the first row mongo.  For this row's value, copy and paste your `mongo connection uri` from above into the value section of this row, e.g. mongodb://sallyuser:sallypassword@aabb22.mongolab.com:11111/nightscout
    
    Name the second row mongo_collection.  For this row's value, enter the name of your collection.  If you followed the example, the name of your collection might be one word, e.g. sally.
    
    When finished, the section will look like this:
    
       ![configure connection strings](http://i.imgur.com/YKVGcIP.png)
    
    If you click Show Connection Strings, you will see something like this (with your own information, of course):
    
    ![alt text](http://i.imgur.com/NLc1Cjo.png)   
 Finally, click **Save** at the bottom of the page.  This ends the work with the Configure tab.  The next step is deployment and it uses the Dashboard tab.

  * Click on the **Dashboard** tab at the top of the page.
  
  <a href="http://imgur.com/iqCK34n"><img src="http://i.imgur.com/iqCK34n.png" title="Hosted by imgur.com"/></a>
  
  Find setup deployment from source control under quick glance .
    ![find setup deployment ](http://i.imgur.com/6UnzWd4.png)
  * Select Github 
  ![select github](http://i.imgur.com/iczHBW6.png)
  * Authorize Github/Azure access.
  * Find `cgm-remote-monitor`:
  
    ![find cgm-remote-monitor repo](http://i.imgur.com/KbhyIcx.png)

  * Confirm, watch the site deploy, it should deploy automatically.

  * Verify operation by visiting the site, e.g.
    `http://nightscoutss.azurewebsites.net`.

  * If blood glucose reaches a dangerous level, an alarm may sound and
    the blood glucose value in the upper right hand corner will turn
    into a red button.  Press the button to silence / acknowledge the
    alarm.  This will also silence the alarm for anyone else who is
    looking at the website.
  * For support, determine your Azure ftp username / password for azure
    website access by following these instructions:
    http://weblogs.asp.net/bleroy/archive/2012/06/12/azure-web-sites-ftp-credentials.aspx

## (Optional) Creating a Widget to View Azure Site on an Android Phone

If you plan on viewing the azure website on an Android phone, you can create a widget which will refresh the data and place it on one of the home screens.  One widget creator that works well is WebSnap.  It is available from the Google Play store, but you will need to purchase the donate version ($2.99) if you want the widget to auto update every 5 minutes (free version will update every 15 minutes).  WebSnap offers a variety of widget sizes, including a scrolling version of the entire webpage.  
To the right is an example of a 4 x 2 widget of Nightscout:
    ![widget](http://i.imgur.com/UuNqiXd.png?1)


