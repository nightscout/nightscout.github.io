# Help me choose

<img src="./img/wizard.png" />

## Welcome to the Nightscout new user wizard.

This set of questions will hopefully help choose the best solution for you, or at least give you hints on where to start. 

```{hint}
*This wizard is thought for one Nightscout site (one patient with diabetes). If you need more Nightscout sites you might need more accounts. Some hosted providers provide discounts, T1Pal support up to 5 patients per subscription.*
```

</br>

| I want to contribute to Nightscout research and development.</br><button>[Yes              ►](https://t1pal.com/)</button> |
| ------------------------------------------------------------ |
| **What is the maximum acceptable cost per month  per site?**</br><select name="cost" id="COST"><br/>  <option value="free">It MUST be free even if it requires a lot of work</option><br/>  <option value="cent" selected="selected">Less than 10c</option><br/>  <option value="pay1">Less than 6$</option><br/>  <option value="pay2">Less than 10$</option><br/>  <option value="pay3">Less than 15$</option><br/></select> |
| **How much of an issue is it when Nightscout is down?**</br><select name="rely" id="RELY"><br/>  <option value="serious">Serious: I need someone to fix it ASAP</option><br/>  <option value="mild" selected="selected">Disturbing: I will look for help and try to fix it myself</option><br/></select> |
| **How much time are you ready to spend on creating and maintaining it?**</br><select name="simple" id="SIMPLE"><br/>  <option value="high">I've got good IT knowledge</option><br/>  <option value="medium" selected="selected">I can follow detailed instructions and take care of it</option><br/>  <option value="easy">I can follow simple instructions and take care of it</option><br/>  <option value="pay">I want someone else to do it for me</option><br/></select> |

<script>
function Validate()
{
	var dbAtla, dbAtlaP, dbRail, dbNort, dbVPS
	var nsHero, nsRail, nsNort, nsAzur, nsVPS, nsFly, nsRend, nsGoog, nsT1Pal, ns10be, nsPro, nsSerendipity, ns4u
	var sDB, sNS
	sDB=""; sNS=""
	dbAtla=1; dbAtlaP=1; dbRail=1; dbNort=1; dbVPS=1;
	nsHero=1; nsRail=1; nsNort=1; nsAzur=1; nsVPS=1; nsFly=1; nsRend=1; nsGoog=1; nsT1Pal=1; ns10be=1; nsPro=1; nsSerendipity=1; ns4u=1;
	sel = document.getElementById("SIMPLE");
	switch(sel.selectedIndex)
	{
		case 0: dbAtla=1; dbAtlaP=1; dbRail=1; dbNort=1; dbVPS=1; nsHero=1; nsRail=1;
	    		nsNort=1; nsAzur=1; nsVPS=1; nsFly=1; nsRend=1; nsGoog=1; nsT1Pal=1; ns10be=1; nsPro=1; nsSerendipity=1; ns4u=1;
	    		sDB="[Reliability constrains removed for IT knowledgeable user]<br />";
	    		sNS="[Reliability constrains removed for IT knowledgeable user]<br />"
	    		break
		case 1: dbVPS=0; nsFly=0; nsVPS=0; break
		case 2: dbAtla=0; dbAtlaP=0; dbRail=0; dbNort=0; dbVPS=0; nsFly=0; nsRend=0; nsVPS=0; break
		case 3: dbAtla=0; dbAtlaP=0; dbRail=0; dbNort=0; dbVPS=0; nsGoog=0; nsHero=0; nsRail=0; nsNort=0;
				nsAzur=0; nsFly=0; nsRend=0; nsGoog=0; nsVPS=0; break
	}
	sel = document.getElementById("COST");
	switch(sel.selectedIndex)
	{
		case 0: dbNort=0; nsHero=0; dbAtlaP=0; dbRail=0; nsGoog=0; nsT1Pal=0; ns10be=0; nsPro=0; nsRail=0; nsSerendipity=0; ns4u=0; break
		case 1: dbNort=0; nsHero=0; dbAtlaP=0; dbRail=0; nsT1Pal=0; ns10be=0; nsPro=0; nsRail=0; nsSerendipity=0; ns4u=0; break
		case 2: dbAtlaP=0; nsT1Pal=0; nsSerendipity=0; ns4u=0; break
		case 3: nsT1Pal=0; nsSerendipity=0; ns4u=0; break
		case 4: break
	}
	sel = document.getElementById("RELY");
	switch(sel.selectedIndex)
	{
		case 0: nsHero=0; dbAtla=0; dbRail=0; dbVPS=0; nsFly=0; nsRend=0; nsGoog=0; nsVPS=0; nsFly=0; break
		case 1: break
	}
	if(dbAtla) sDB=sDB+" - Free MongoDB Atlas (limited to 512MiB) <br />"
	if(dbAtlaP) sDB=sDB+" - M2 MongoDB Atlas (9$/month) <br />"
	if(dbRail) sDB=sDB+" - Railway Mongo database (10$/GiB/month)<br />"
	if(dbNort) sDB=sDB+" - Northflank Mongo database (0.3$/GiB/month) <br />"
	if(dbVPS) sDB=sDB+" - VPS Mongo database (Oracle, Google, ...) <br />"
	if(nsT1Pal|ns10be|nsPro|nsSerendipity|ns4u) sDB=sDB+" - Database included in the hosted service <br />"
	if(nsGoog) sDB=sDB+" - Database included in Google Cloud <br />"
	if(sDB=="") sDB="Uh... not many choices there, try to change some options and retry."
	document.getElementById("resultDB").innerHTML = sDB;
	if(sDB!=" - Database included in the hosted service"&sDB!="Uh... not many choices there, try to change some options and retry.")
	{
		if(sDB!=" - Database included in Google Cloud <br />"&sDB!=" - Database included in the hosted service <br /> - Database included in Google Cloud <br />")
		{
			if(nsHero) sNS=sNS+" - Heroku Eco plan (5$/month) <br />"
			if(nsRail) sNS=sNS+" - Railway Hobby plan (5$/month)<br />"
			if(nsNort) sNS=sNS+" - Northflank Free Developer plan <br />"
			if(nsAzur) sNS=sNS+" - Azure Basic plan (using always free services) <br />"
			if(nsVPS) sNS=sNS+" - Oracle Cloud Free E2.1 micro tier <br />"
			if(nsFly) sNS=sNS+" - Fly.io Free Hobby plan <br />"
            if(nsRend) sNS=sNS+" - Render Free Instance <br />"
		}
		if(nsGoog) sNS=sNS+" - Google Cloud Free e2-micro tier <br />"
	}
	if(nsT1Pal) sNS=sNS+" - T1Pal Hosted Nightscout (11.99$/month) <br />"
	if(ns10be) sNS=sNS+" - NS10BE Hosted Nightscout (from €4.99/month) <br />"
	if(nsPro) sNS=sNS+" - Nightscout Pro Hosted service (3£/month) <br />"
	if(nsSerendipity) sNS=sNS+" - Serendipity Bio  Hosted service (12.99$/month) <br />"
	if(ns4u) sNS=sNS+" - Nightscout4u Hosted service (€1/instance/month) <br />"
	if(sNS=="") sNS="Uh... not many choices there, try to change some options and retry."
	document.getElementById("resultNS").innerHTML = sNS;
}
</script>





</br>

Now click SHOW below to validate your choices.  
If you change any option above, validate again to update. </br></br>
<button onclick="Validate()">-> SHOW</button>

```{card}
### **Database options**
^^^
<p style="font-size:18px" id="resultDB">-</p>
```

```{card}
### **Nightscout options**
^^^
<p style="font-size:18px" id="resultNS">-</p>
```

Made you mind? Have a look at your options:

## <u>Hosted</u>

[T1Pal](/index.md#t1pal)  
[NS10BE](/index.md#ns10be)  
[Nightscout Pro](/index.md#nightscout-pro)  
[Serendipity Bio](/index.md#serendipity-bio)  
[Nightscout4u](/index.md#nightscout4u)  

## <u>Database</u>

[MongoDB Atlas](/vendors/mongodb/atlas.md)  
[Railway Mongo Database](/vendors/railway/database.md)  
[Northflank Mongo Database](/vendors/northflank/database.md)  
VPS Mongo Database

## <u>Provider</u>

[Heroku Eco plan](/vendors/heroku/new_user.md)  
[Railway](/vendors/railway/new_user.md)  
[Northflank](/vendors/northflank/new_user.md)  
[Fly.io](/vendors/fly.io/new_user.md)  
[Azure](/vendors/azure/new_user.md)  
[Render](/vendors/render/new_user.md)

## <u>VPS</u>

[Google Cloud](/vendors/google/new_user.md)  
[Oracle Cloud](https://www.dropbox.com/s/5twlqrndofqno0t/0-amber-oracle.pdf)  
[Advanced DIY](/nightscout/advanced)
