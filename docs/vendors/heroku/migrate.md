# Migration?

The [deadline](https://blog.heroku.com/next-chapter) is in the past now, but if you used Heroku and would like to revive your site, one question remains: "What should I do with my Nightscout, should I migrate, where? What is recommended?"

There is no universal solution. So, you'll have to read between the lines and understand what's the best strategy for you, as we have different needs, skills and budgets.

## **[TANSTAAFL](https://en.wiktionary.org/wiki/TANSTAAFL)**

This is an important concept everybody needs to understand: what we call free means we don't have to pay for it but it also means someone else is paying for it. It doesn't mean it's bad, we all know the price of T1D is already too high for us and our kids but we can't **pretend** that someone else will pay for it. Whoever offers a free service should have our respect and gratitude, and when they decide the weight of free users is too high and decide to start billing, we should accept it.

```{admonition} Confusing?
:class: hint
**[Need help to choose?
Try the wizard](/nightscout/wizard)**.
<img src="/nightscout/img/wizard.png" />
```

## **[T1Pal](/index.md#t1pal)**

***You need a simple reliable Nightscout but don't want to build it and maintain it?***

T1Pal is made by developers who contribute to Nightscout development, it doesn't include all bells and whistles (see the differences [here](https://t1pal.com/legal/faq_8_18_2020_13_38#compare-to-nightscout)) but you won't have to worry about security, upgrades or database size. If you will want to pay a vendor for your DIY Nightscout you should seriously consider T1Pal. Also, if you need to support multiple T1D people in a family that's surely something to think about as you can have up to 5 sites in one subscription. Data migration is not available, contact T1Pal support for settings migration.

## **[NS10BE](/index.md#ns10be)**

***You need a simple reliable Nightscout but don't want to build it and maintain it?***

You can create Nightscout with a few clicks and won't have to worry about maintenance, updates, database space and CPU limits.  Some features are not available for legal reasons and if you need extra variables setup you can contact NS10BE support. You will need to copy your Nightscout settings but can migrate your Mongo database easily in NS10BE.

## **[Nightscout.Pro](/index.md#nightscout-pro)**

***You need a simple reliable Nightscout but don't want to build it and maintain it?***

A completely 'hands-off' approach to Nightscout. Simply subscribe via the [website](https://nightscout.pro/) and you'll receive an email once your site is ready. Enjoy unlimited database and resources and do not have to worry about updating your nightscout site as it all taken care of for you.

## **[Heroku](/vendors/heroku/ecoplan)**

***You liked the Heroku experience and don't want to change? An Eco plan subscription is all it takes to continue like that.***

Heroku is still a valid choice for running Nightscout. Someone reminded me they've been offering a free account to many of us for years so there's no reason not to pay for an Eco account and let it go as before. Still, it is not set it and forget it and you will need to keep it updated yourself. And that MongoDB Atlas database still is a weak point.

## **[Azure](/vendors/azure/new_user)**

***You need a reliable engine for your Nightscout site, well Azure sure is the way to go.***

Azure is back hurrah hurrah. Wait, why did we leave it some years ago? Ah, sure, costs. But we believe we have a free solution thanks to [Scott](https://www.youtube.com/watch?v=EDADrteGBnY). Shame the Cosmos database doesn't always meet expectations... And keep in mind the free tier is designed for testing, not production.

## [**MongoDB Atlas**](/vendors/mongodb/atlas)

***You need a small free database? An M0 Atlas does that and nothing more.***

Since they bought mLab, most of us have a database in MongoDB. This is a weak point of Nightscout DIY and forced our developers to do a lot of work to cope with it. An M0 free database is very limited in size and DIY Loopers/AAPS'ers should be very careful to keep the database below 512MB before their site crashes.

## [**Google Cloud**](https://navid200.github.io/xDrip/docs/Nightscout/GoogleCloud)

***You're not scared to innovate with a new easy and reliable way to build and maintain your Nightscout? Give this a try!***

With the xDrip+ team trying to make it so easy that the solutions above will look difficult, you need to try it to believe it.

*Note: You can use this method to deploy in Digital Ocean and other VPS*

## **[Railway](/vendors/railway/new_user)**

***You want a simple and free alternative to Heroku? Railway is for you... if you're not worried you might have to migrate again in the future.***

We really liked the Railway solution when we found it: it's very simple to migrate and the platform is simple to use. Still, we discovered some Nightscout followers are suffering network related issues. But the main worry with Railway is that they're a startup company and even if they're eager to see more users coming we don't know how they'll react when too many of us use their servers ... for free. TANSTAAFL above.

## **[Northflank](/vendors/northflank/new_user)**

***Everybody else is going for Railway and you prefer a safer alternative because you're not afraid of an ugly Nightscout site name or adding a DDNS? Northflank is a good idea.***

Not very sponsored, Northflank is also a good option, simple of use and offering a migration utility. The only issue is trying to remember your Nightscout site name (try `night--spicy-steam--nightscout--ci95-l9xw.code.run` for example). But this can be fixed easily using a free [DDNS](/nightscout/dns) service.

## **[Fly.io](/vendors/fly.io/migrate)**

***You're desperate to migrate now because it's too late for choices and you don't care about the future? Fly.io migration is the easiest immediate choice... but if you don't like typing commands on your computer you'll short be facing a hard stop.***

Fly.io was immediately popular due to the ease of migration from Heroku (for those not forgetting to unlink Heroku afterwards). Now, if you want to maintain your site you'll have to use the `flyctl` command line as the web interface is mainly for monitoring. On the other hand, if you don't mind command line instructions, it is a very good solution. But a computer is mandatory (i.e. issues can't be fixed from your phone) and very few of us go around with a laptop all day long...

## [**Oracle Cloud**](https://www.dropbox.com/s/5twlqrndofqno0t/0-amber-oracle.pdf)

***You're ready to type commands in a terminal window, following an accurate step by step guide? Oracle Cloud solution is worth a try.***

Follow this very detailed guide to build your Nightscout site. It also contains a lot of reference information for VPS DIY Nightscout, including Docker.

</br>
