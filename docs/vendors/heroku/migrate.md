# Migration?

As the [deadline](https://blog.heroku.com/next-chapter) is coming closer, one question starts to come up more frequently. What should I do with my Nightscout, should I migrate, where? What is recommended?

There is no universal solution. So, we'll have to read between the lines and understand what's the best strategy for each of us, as we have different needs, skills and budgets.

##### **HISTORY**

Digging in Facebook, GitHub and the internet you'll discover Jason Calabrese used DigitalOcean, and in the early 2014 the deploy to Azure and Heroku buttons were added to the repo with the original developer's agreement.

##### **[TANSTAAFL](https://en.wiktionary.org/wiki/TANSTAAFL)**

This is an important concept everybody needs to understand: what we call free means we don't have to pay for it but it also means someone else is paying for it. It doesn't mean it's bad, we all know the price of T1D is already too high for us and our kids but we can't **pretend** that someone else will pay for it. Whoever offers a free service should have our respect and gratitude, and when they decide the weight of free users is too high and decide to start billing, we should accept it.

##### **HOSTED SOLUTIONS**

***You need a reliable Nightscout but don't want to build it and maintain it? T1Pal and NS10BE are your best choices.***

Someone told me too few people know about the [hosted solutions recommended by our developers](https://nightscout.github.io/#nightscout-as-a-service). If you will want to pay a vendor for your DIY Nightscout you should seriously consider them. Also, if you need to support multiple T1D people in a family that's surely something to think about.

##### **HEROKU**

***You liked the Heroku experience and don't want to change? A [Hobby account subscription](../hobbyplan) is all it takes to continue like that.***

Heroku is a great choice even if 7$ per month is a lot for running Nightscout. Someone reminded me they've been offering a free account to many of us for years so there's no reason not to pay for a Hobby account and let it go as before. **Con:** it remains DIY, not set it and forget it though.

##### **AZURE**

***You need a reliable engine for your Nightscout site, well [Azure](../../azure/migrate) sure is the way to go.***

Azure is back hurrah hurrah. Wait, why did we leave it some years ago? Ah, sure, costs. But we believe we have a free solution thanks to [Scott](https://www.youtube.com/watch?v=EDADrteGBnY).**MONGODB ATLAS**

***You need a small free database? An [M0 Atlas](../../mongodb/atlas) does that and nothing more.***

Since they bought mLab, most of us have a database in MongoDB. This is a weak point of Nightscout DIY and forced our developers to do a lot of work to cope with it. An M0 free database is very limited in size and DIY Loopers/AAPS'ers should be very careful to keep the database below 512MB before their site crashes.

##### **RAILWAY**

***You want a simple and free alternative to Heroku? [Railway](../../railway/migration) is for you... if you're not worried you might have to migrate again in the future.***

We really liked the Railway solution when we found it: it's very simple to migrate and the platform is simple to use. Still, we discovered M5Stack Nightscout devices didn't like the network performance and resets... probably some other followers are suffering related issues. But the main worry with Railway is that they're a startup company and even if they're eager to see more users coming we don't know how they'll react when too many of us use their servers ... for free. TANSTAAFL above.

##### **NORTHFLANK**

***Everybody else is going for Railway and you prefer a safer alternative because you're not afraid of an ugly Nightscout site name or adding a DDNS? [Northflank](../../northflank/migrate) is a good idea.***

Not very sponsored, Northflank is also a good option, simple of use and offering a migration utility. The only issue is trying to remember your Nightscout site name (try night--spicy-steam--nightscout--ci95-l9xw.code.run for example). But this can be fixed easily using a free DDNS service like NoIP or Dynu. Also, same than above, small company and TANSTAAFL.

##### **FLY.IO**

***You're desperate to migrate now because it's too late for choices and you don't care about the future? [Fly.io migration](../../fly.io/migrate) is the easiest immediate choice... but if you don't like typing commands on your computer you'll short be facing a hard stop.***

Fly.io was immediately popular due to the ease of migration from Heroku (for those not forgetting to unlink Heroku afterwards). Now, if you want to maintain your site you'll have to use the flyctl command line as the web interface is mainly for monitoring. On the other hand, if you don't mind command line instructions, it is a very good solution. But a computer is mandatory (i.e. issues can't be fixed from your phone) and very few of us go around with a laptop all day long...

##### **GOOGLE CLOUD**

***You're not scared to innovate with a new easy and reliable way to build and maintain your Nightscout? Give this a try!***

With the xDrip+ team trying to make it so easy that the solutions above will look difficult, already available and [you need to try it](https://navid200.github.io/xDrip/docs/Nightscout/GoogleCloud) to believe it. 

