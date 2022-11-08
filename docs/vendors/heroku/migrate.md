# Migration?

As the [deadline](https://blog.heroku.com/next-chapter) is coming closer, one question starts to come up more frequently. What should I do with my Nightscout, should I migrate, where? What is recommended?

There is no universal solution. So, you'll have to read between the lines and understand what's the best strategy for you, as we have different needs, skills and budgets.

## **[TANSTAAFL](https://en.wiktionary.org/wiki/TANSTAAFL)**

This is an important concept everybody needs to understand: what we call free means we don't have to pay for it but it also means someone else is paying for it. It doesn't mean it's bad, we all know the price of T1D is already too high for us and our kids but we can't **pretend** that someone else will pay for it. Whoever offers a free service should have our respect and gratitude, and when they decide the weight of free users is too high and decide to start billing, we should accept it.

## **[T1Pal](../../../#t1pal)**

***You need a simple reliable Nightscout but don't want to build it and maintain it?***

T1Pal is made by developers who contribute to Nightscout development, it doesn't include all bells and whistles (see the differences [here](https://t1pal.com/legal/faq_8_18_2020_13_38#compare-to-nightscout)) but you won't have to worry about security, upgrades or database size. If you will want to pay a vendor for your DIY Nightscout you should seriously consider T1Pal. Also, if you need to support multiple T1D people in a family that's surely something to think about as you can have up to 5 sites in one subscription. Data migration is not available, contact T1Pal support for settings migration.

## **[NS10BE](../../../#ns10be)**

***You need a simple reliable Nightscout but don't want to build it and maintain it?***

You can create Nightscout with a few clicks and won't have to worry about maintenance, updates, database space and CPU limits.  Some features are not available for legal reasons and if you need extra variables setup you can contact NS10BE support. You will need to copy your Nightscout settings but can migrate your Mongo database easily in NS10BE.

## **Heroku**

***You liked the Heroku experience and don't want to change? An [Eco plan subscription](../ecoplan) is all it takes to continue like that.***

Heroku is still a valid choice for running Nightscout. Someone reminded me they've been offering a free account to many of us for years so there's no reason not to pay for an Eco account and let it go as before. Still, it is not set it and forget it and you will need to keep it updated yourself. And that MongoDB Atlas database still is a weak point.

## **Azure**

***You need a reliable engine for your Nightscout site, well [Azure](../../azure/migrate) sure is the way to go.***

Azure is back hurrah hurrah. Wait, why did we leave it some years ago? Ah, sure, costs. But we believe we have a free solution thanks to [Scott](https://www.youtube.com/watch?v=EDADrteGBnY). Shame the Cosmos database didn't meet expectations... And keep in mind the free tier is designed for testing, not production.

## **MongoDB Atlas**

***You need a small free database? An [M0 Atlas](../../mongodb/atlas) does that and nothing more.***

Since they bought mLab, most of us have a database in MongoDB. This is a weak point of Nightscout DIY and forced our developers to do a lot of work to cope with it. An M0 free database is very limited in size and DIY Loopers/AAPS'ers should be very careful to keep the database below 512MB before their site crashes.

## [**Google Cloud**](https://navid200.github.io/xDrip/docs/Nightscout/GoogleCloud)

***You're not scared to innovate with a new easy and reliable way to build and maintain your Nightscout? Give this a try!***

With the xDrip+ team trying to make it so easy that the solutions above will look difficult, [you need to try it](https://navid200.github.io/xDrip/docs/Nightscout/GoogleCloud) to believe it. 

## **Railway**

***You want a simple and free alternative to Heroku? [Railway](../../railway/migration) is for you... if you're not worried you might have to migrate again in the future.***

We really liked the Railway solution when we found it: it's very simple to migrate and the platform is simple to use. Still, we discovered some Nightscout followers are suffering network related issues. But the main worry with Railway is that they're a startup company and even if they're eager to see more users coming we don't know how they'll react when too many of us use their servers ... for free. TANSTAAFL above.

## **Northflank**

***Everybody else is going for Railway and you prefer a safer alternative because you're not afraid of an ugly Nightscout site name or adding a DDNS? [Northflank](../../northflank/migrate) is a good idea.***

Not very sponsored, Northflank is also a good option, simple of use and offering a migration utility(1). The only issue is trying to remember your Nightscout site name (try night--spicy-steam--nightscout--ci95-l9xw.code.run for example). But this can be fixed easily using a free DDNS service like [NoIP](https://www.noip.com/),  [Dynu](https://www.dynu.com/), [FreeDNS](https://freedns.afraid.org/). Also, same than above, small company and TANSTAAFL.  
(1) *You need to send an email request to enable the migration utility*.

## **Fly.io**

***You're desperate to migrate now because it's too late for choices and you don't care about the future? [Fly.io migration](../../fly.io/migrate) is the easiest immediate choice... but if you don't like typing commands on your computer you'll short be facing a hard stop.***

Fly.io was immediately popular due to the ease of migration from Heroku (for those not forgetting to unlink Heroku afterwards). Now, if you want to maintain your site you'll have to use the flyctl command line as the web interface is mainly for monitoring. On the other hand, if you don't mind command line instructions, it is a very good solution. But a computer is mandatory (i.e. issues can't be fixed from your phone) and very few of us go around with a laptop all day long...

</br>
