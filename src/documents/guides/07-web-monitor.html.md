---
title: Monitor CGM on the web
layout: guide
pageOrder: 7
tags: ['guide','quickstart','post']
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
    Find the configure tab
    ![go to configure tab](http://i.imgur.com/dIPRHjt.png)

    Find the connection strings:
    ![connection strings](http://i.imgur.com/PZjxkjE.png)

    Create two new **Custom** rows.  Enter your mongo details from
    before, using the **`Custom`** type, for
    `mongo` and `mongo_collection` keys.
    **Copy and paste** your `mongo connection uri` from above in the
    new `mongo  <mongo connection uri>  Custom` row.
    ![configure connection strings](http://i.imgur.com/YKVGcIP.png)
    The `mongo` key should be the `mongo://` url from the Android App.
    The `mongo_collection` key should match the collection from the
    MongoLab setup.


  * Find setup deployment from the `Dashboard` tab of the project.
    ![find setup deployment ](http://i.imgur.com/6UnzWd4.png)
  * Select Github ![select github](http://i.imgur.com/iczHBW6.png)
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

