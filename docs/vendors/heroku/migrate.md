# Migration?

As the [deadline](https://blog.heroku.com/next-chapter) is coming closer, one question starts to come up more frequently. What should I do with my Nightscout, should I migrate, where? What is recommended?

There is no universal solution. So, you'll have to read between the lines and understand what's the best strategy for you, as we have different needs, skills and budgets.

There's no simple answer to this. You basically have two options:

1. **DIY** Use instructions on this website or your computing skills to create your own installation. Depending on your skill and choice of platform, this can take anywhere from minutes to hours to accomplish. Additionally, you will need to maintain this installation yourself. Having said that, there are cloud providers that offer the needed hosting services for free with a variety of restrictions, so your monthly hosting cost can be **free** - $0 with this option. Historically vast majority of Nightscout users have opted for this choice. Of note, with this option you are the person responsible for ensuring the service is up when you need it. The community aims to support people who choose this option, but this is entirely driven by a voluteer effort and support might not be available when you need it. Additionally, it's important to understand that if you're using a free tier of a hosting service to run Nightscout, your hosting costs are being paid by the hosting provider you're using.
2. **Use a service** You can use a hosting provider that does all of this work for you in exchange for a monthly fee. There are currently two options available for this ([NS10BE](#ns10be) and [T1Pal](#t1pal)), both of which are from active Nightscout community members. If you're a non-technical person, this is a **great choice**.

The Nightscout development community actively supports both of these choices.

## **[TANSTAAFL](https://en.wiktionary.org/wiki/TANSTAAFL)**

This is an important concept everybody needs to understand: what we call free means we don't have to pay for it but it also means someone else is paying for it. It doesn't mean it's bad, we all know the price of T1D is already too high for us and our kids but we can't **pretend** that someone else will pay for it. Whoever offers a free service should have our respect and gratitude, and when they decide the weight of free users is too high and decide to start billing, we should accept it.

## [**HOSTED SOLUTIONS**](https://nightscout.github.io/#nightscout-as-a-service)

***You need a reliable Nightscout but don't want to build it and maintain it? T1Pal and NS10BE are your best choices.***

### T1Pal

![](https://t1pal.com/media/t1pal/t1_pal_bear_bw.png)

[T1Pal](https://t1pal.com) directly supports the sustainability of the Nightscout Project. The monthly subscription for T1Pal is $11.99 USD/month.

The T1Pal hosting service has been developed by **Ben West**, a member of the original CGM in the Cloud team and an original lead core developer for the Nightscout Project. Database and server administration is automated and managed automatically as part of the service. Contact T1Pal support to request specific features or versions.

If you need help with T1Pal, please file a support ticket by emailing ***support*** at ***t1pal.com***, or select "Get Support" from [My Account](https://www.t1pal.com/account/).


### NS10BE

<img src="https://ns.10be.de/templates/images/ns.10be.de-logo_halb_klein.jpg" width="400" height="155">

[ns.10BE.de](https://ns.10be.de/) was started in Nov 2017 and offers full managed Nightscout Services. You can create Nightscout with a few clicks and won't have to worry about maintenance, updates, database space and CPU limits. A backup of your database and settings is performed every 6-8 hours. You can import data from your old Nightscout instance or MongoDB database, also upload data (Freestyle, Dexcom, Omnipod, ...) via CSV files. The servers are located in different fail-safe data centers in Germany, Finland or France (can be selected) . They are monitored by [uptimerobot](https://ns.10be.de/en/status.html) and own Slackbot. When a server goes down, it restarts itself and sends a twitter message.

A Nightscout Instance at NS10BE costs €4.99/month, with discounts when increasing subscription duration.

To see more about NS10 features and costs, take a look at the [features page](https://10be.de/en/pricing.html). The registration is free.

***Support:*** ***support*** at ***ns.10be.de*** or [https://10be.de/en/contact.html](https://10be.de/en/contact.html) or [https://twitter.com/10be_de](https://twitter.com/10be_de) or [https://www.facebook.com/10be.de](https://www.facebook.com/10be.de)


## **[HEROKU]()**

***You liked the Heroku experience and don't want to change? A [Hobby account subscription](../hobbyplan) is all it takes to continue like that.***

Heroku is a great choice even if 7$ per month is a lot for running Nightscout. Someone reminded me they've been offering a free account to many of us for years so there's no reason not to pay for a Hobby account and let it go as before. **Con:** it remains DIY, not set it and forget it though.

## **[AZURE]()**

***You need a reliable engine for your Nightscout site, well [Azure](../../azure/migrate) sure is the way to go.***

Azure is back hurrah hurrah. Wait, why did we leave it some years ago? Ah, sure, costs. But we believe we have a free solution thanks to [Scott](https://www.youtube.com/watch?v=EDADrteGBnY).

## **MONGODB ATLAS**

***You need a small free database? An [M0 Atlas](../../mongodb/atlas) does that and nothing more.***

Since they bought mLab, most of us have a database in MongoDB. This is a weak point of Nightscout DIY and forced our developers to do a lot of work to cope with it. An M0 free database is very limited in size and DIY Loopers/AAPS'ers should be very careful to keep the database below 512MB before their site crashes.

## **[RAILWAY]()**

***You want a simple and free alternative to Heroku? [Railway](../../railway/migration) is for you... if you're not worried you might have to migrate again in the future.***

We really liked the Railway solution when we found it: it's very simple to migrate and the platform is simple to use. Still, we discovered M5Stack Nightscout devices didn't like the network performance and resets... probably some other followers are suffering related issues. But the main worry with Railway is that they're a startup company and even if they're eager to see more users coming we don't know how they'll react when too many of us use their servers ... for free. TANSTAAFL above.

## **[NORTHFLANK]()**

***Everybody else is going for Railway and you prefer a safer alternative because you're not afraid of an ugly Nightscout site name or adding a DDNS? [Northflank](../../northflank/migrate) is a good idea.***

Not very sponsored, Northflank is also a good option, simple of use and offering a migration utility(1). The only issue is trying to remember your Nightscout site name (try night--spicy-steam--nightscout--ci95-l9xw.code.run for example). But this can be fixed easily using a free DDNS service like [NoIP](https://www.noip.com/) or [Dynu](https://www.dynu.com/). Also, same than above, small company and TANSTAAFL.  
(1) *You need to send an email request to enable the migration utility*.

## [**FLY.IO**]()

***You're desperate to migrate now because it's too late for choices and you don't care about the future? [Fly.io migration](../../fly.io/migrate) is the easiest immediate choice... but if you don't like typing commands on your computer you'll short be facing a hard stop.***

Fly.io was immediately popular due to the ease of migration from Heroku (for those not forgetting to unlink Heroku afterwards). Now, if you want to maintain your site you'll have to use the flyctl command line as the web interface is mainly for monitoring. On the other hand, if you don't mind command line instructions, it is a very good solution. But a computer is mandatory (i.e. issues can't be fixed from your phone) and very few of us go around with a laptop all day long...

## [**GOOGLE CLOUD**](https://navid200.github.io/xDrip/docs/Nightscout/GoogleCloud)

***You're not scared to innovate with a new easy and reliable way to build and maintain your Nightscout? Give this a try!***

With the xDrip+ team trying to make it so easy that the solutions above will look difficult, already available and [you need to try it](https://navid200.github.io/xDrip/docs/Nightscout/GoogleCloud) to believe it. 

</br>
