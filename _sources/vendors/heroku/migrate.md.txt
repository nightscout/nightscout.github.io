# Migration?

As Heroku and Railway stopped their free plan, if you would like to revive your site, one question remains: "What should I do with my Nightscout, should I migrate, where? What is recommended?"

There is no universal solution. So, you'll have to read between the lines and understand what's the best strategy for you, as we have different needs, skills and budgets.

## **[TANSTAAFL](https://en.wiktionary.org/wiki/TANSTAAFL)**

This is an important concept everybody needs to understand: what we call free means we don't have to pay for it but it also means someone else is paying for it. It doesn't mean it's bad, we all know the price of T1D is already too high for us and our kids but we can't **pretend** that someone else will pay for it. Whoever offers a free service should have our respect and gratitude, and when they understand the weight of free users is too high and decide to start billing, we should accept it.

## [**Google Cloud**](https://navid200.github.io/xDrip/docs/Nightscout/GoogleCloud)

***You're not scared to innovate with a new easy and reliable way to build and maintain your Nightscout? Give this a try!***

With the xDrip+ team trying to make it so easy that the solutions above will look difficult, you need to try it to believe it.

*Note: You can use this method to deploy in Digital Ocean and other VPS*

## **[Azure](/vendors/azure/new_user)**

***You need a reliable engine for your Nightscout site, well Azure sure is the way to go.***

Azure is back hurrah hurrah. Wait, why did we leave it some years ago? Ah, sure, costs. But we believe we have a free solution thanks to Scott. Shame the Cosmos database doesn't always meet expectations... And keep in mind the free tier is designed for testing, not production.

## **[Heroku](/vendors/heroku/ecoplan)**

***You liked the Heroku experience and don't want to change? An Eco plan subscription is all it takes to continue like that.***

Heroku is still a valid choice for running Nightscout. Someone reminded me they've been offering a free account to many of us for years so there's no reason not to pay for an Eco account and let it go as before. Still, it is not set it and forget it and you will need to keep it updated yourself. And that MongoDB Atlas database still is a weak point.

## [**MongoDB Atlas**](/vendors/mongodb/atlas)

***You need a small free database? An M0 Atlas does that and nothing more.***

Since they bought mLab, most have a database in MongoDB. This is a weak point of Nightscout DIY and forced our developers to do a lot of work to cope with it. An M0 free database is very limited in size and DIY Loopers/AAPS'ers should be very careful to keep the database below 512MB before their site crashes. Also, recently MongoDB Atlas is recording us this is a sandbox database (i.e. for testing) and not for production (continuous use). An M2 database only removes size limitations and is not worth the cost versus hosted solutions.

## **[Railway](/vendors/railway/new_user)**

***You want an alternative to Heroku? Railway costs the same than the Eco plan.***

We really liked the Railway solution when we found it: it's very simple to migrate from Heroku and the platform is simple to use. Still, we discovered some Nightscout followers are suffering network related issues. The free plan has been removed and the Hobby plan is starting at 5$ per month (which should be enough for a single Nightscout site).

## **[Northflank](/vendors/northflank/new_user)**

***Everybody else is going for Railway and you prefer a safer alternative because you're not afraid of an ugly Nightscout site name? Northflank is a good idea.***

Not very sponsored, Northflank is also a good option, simple of use and offering a migration utility. The only issue is trying to remember your Nightscout site name (try `night--spicy-steam--nightscout--ci95-l9xw.code.run` for example). Still, Northflank is a reliable provider. But they will most probably review their free plan in the future.

## **Fly.io**

***Fly.io still offers a free tier but if you don't like typing commands on your computer you'll short be facing a hard stop.***

Fly.io was immediately popular due to the ease of migration from Heroku (the migration wizard has been removed). Now, if you want to maintain your site you'll have to use command line instructions in the web terminal. On the other hand, it is a good solution.

## [**Oracle Cloud**](https://www.dropbox.com/s/5twlqrndofqno0t/0-amber-oracle.pdf)

***You're ready to type commands in a terminal window, following an accurate step by step guide? Oracle Cloud solution is worth a try.***

Follow this very detailed guide to build your Nightscout site. It also contains a lot of reference information for VPS DIY Nightscout, including Docker.

</br>
