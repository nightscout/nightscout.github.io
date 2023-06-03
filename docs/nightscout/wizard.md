# Help me choose

<img src="./img/wizard.png" />

## Welcome to the Nightscout new user wizard.

This set of questions will hopefully help choose the best solution for you, or at least give you hints on where to start. 

```{hint}
*This wizard is thought for one Nightscout site (one patient with diabetes). If you need more Nightscout sites you might need more accounts. Some hosted providers provide discounts and T1Pal support up to 5 patients per subscription.*
```

```{admonition} [TANSTAAFL](https://en.wiktionary.org/wiki/TANSTAAFL)
:class: note
If it's cheap and easy it might not be as reliable as you'd like  
If it's cheap and reliable it might be difficult to build or maintain  
If it's simple and reliable it might not be free  
**Free, simple and reliable is not available.**
```

</br>

| I want to contribute to Nightscout research and development.</br><select name="cont" id="CONT"><br/>  <option value="yes" selected="selected">Yes</option><br/>  <option value="no">No</option><br/></select> |
| ------------------------------------------------------------ |
| **What is the maximum acceptable cost per month  per site?**</br><select name="cost" id="COST"><br/>  <option value="free">It MUST be free even if it requires a lot of work</option><br/>  <option value="cent">Less than 10c</option><br/>  <option value="pay1">Less than 6$</option><br/>  <option value="pay2">Less than 10$</option><br/>  <option value="pay3" selected="selected">Less than 15$</option><br/></select> |
| **How much of an issue is it when Nightscout is down?**</br><select name="rely" id="RELY"><br/>  <option value="serious" selected="selected">Serious: I need it back up ASAP</option><br/>  <option value="mild">Disturbing: If I can get it back up in less than a week I'm ok</option><br/>  <option value="none">It happens: I'll do without until I can get it fixed</option><br/></select> |
| **How much time are you ready to spend on creating and maintaining it?**</br><select name="simple" id="SIMPLE"><br/>  <option value="high">I've got good IT knowledge</option><br/>  <option value="medium">I can follow detailed instructions and take care of it</option><br/>  <option value="easy">I can follow simple instructions and take care of it</option><br/>  <option value="pay" selected="selected">I want someone else to do it for me</option><br/></select> |

<script>
function Validate()
{
	var dbAtla, dbAtlaP, dbRail, dbNort, dbVPS
	var nsHero, nsRail, nsNort, nsAzur, nsVPS, nsFly, nsGoog, nsT1Pal, ns10be, nsPro
	var sDB, sNS
	sDB=""; sNS=""
	dbAtla=1; dbAtlaP=1; dbRail=1; dbNort=1; dbVPS=1;
	nsHero=1; nsRail=1; nsNort=1; nsAzur=1; nsVPS=1; nsFly=1; nsGoog=1; nsT1Pal=1; ns10be=1; nsPro=1
	sel = document.getElementById("CONT");
	switch(sel.selectedIndex)
	{
	    case 0: dbAtla=0; dbAtlaP=0; dbRail=0; dbNort=0; dbVPS=0;
		nsHero=0; nsRail=0; nsNort=0; nsAzur=0; nsVPS=0; nsFly=0; nsGoog=0; ns10be=0; nsPro=0;
		break;
	}
	sel = document.getElementById("SIMPLE");
	switch(sel.selectedIndex)
	{
		case 0: dbAtla=1; dbAtlaP=1; dbRail=1; dbNort=1; dbVPS=1; nsHero=1; nsRail=1;
	    		nsNort=1; nsAzur=1; nsVPS=1; nsFly=1; nsGoog=1; nsT1Pal=1; ns10be=1; nsPro=1; 
	    		sDB="[Reliability constrains removed for IT knowledgeable user]<br />";
	    		sNS="[Reliability constrains removed for IT knowledgeable user]<br />"
	    		break
		case 1: dbVPS=0; nsFly=0; nsVPS=0; break
		case 2: dbAtla=0; dbAtlaP=0; dbRail=0; dbNort=0; dbVPS=0; nsFly=0; nsVPS=0; break
		case 3: dbAtla=0; dbAtlaP=0; dbRail=0; dbNort=0; dbVPS=0; nsGoog=0; nsHero=0; nsRail=0; nsNort=0;
				nsAzur=0; nsFly=0; nsGoog=0; nsVPS=0; break
	}
	sel = document.getElementById("COST");
	switch(sel.selectedIndex)
	{
		case 0: dbNort=0; nsHero=0; dbAtlaP=0; dbRail=0; nsGoog=0; nsT1Pal=0; ns10be=0; nsPro=0; nsRail=0; break
		case 1: dbNort=0; nsHero=0; dbAtlaP=0; dbRail=0; nsT1Pal=0; ns10be=0; nsPro=0; nsRail=0; break
		case 2: dbAtlaP=0; nsT1Pal=0; break
		case 3: nsT1Pal=0; break
		case 4: break
	}
	sel = document.getElementById("RELY");
	switch(sel.selectedIndex)
	{
		case 0: nsHero=0; dbAtla=0; dbRail=0; dbVPS=0; nsFly=0; nsGoog=0; nsVPS=0; break
		case 1: nsFly=0; break
		case 2: break
	}
	if(dbAtla) sDB=sDB+" - Free MongoDB Atlas (limited to 512MiB) <br />"
	if(dbAtlaP) sDB=sDB+" - M2 MongoDB Atlas (9$/month) <br />"
	if(dbRail) sDB=sDB+" - Railway Mongo database (10$/GiB/month)<br />"
	if(dbNort) sDB=sDB+" - Northflank Mongo database (0.3$/GiB/month) <br />"
	if(dbVPS) sDB=sDB+" - VPS Mongo database (Oracle, Google, ...) <br />"
	if(nsT1Pal|ns10be|nsPro) sDB=sDB+" - Database included in the hosted service <br />"
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
		}
		if(nsGoog) sNS=sNS+" - Google Cloud Free e2-micro tier <br />"
	}
	if(nsT1Pal) sNS=sNS+" - T1Pal Hosted Nightscout (11.99$/month) <br />"
	if(ns10be) sNS=sNS+" - NS10BE Hosted Nightscout (from €4.99/month) <br />"
	if(nsPro) sNS=sNS+" - Nightscout Pro Hosted service (3£/month) <br />"
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
[Nightscout.pro](/index.md#nightscout-pro)

## <u>Database</u>

[MongoDB Atlas](/vendors/mongodb/atlas.md)  
MongoDB Atlas M2 - Not documented: Hosted solutions are more economic  
[Railway Mongo Database](/vendors/railway/database.md)  
[Northflank Mongo Database](/vendors/northflank/database.md)  
VPS Mongo Database

## <u>Provider</u>

[Heroku Eco plan](/vendors/heroku/new_user.md)  
[Railway](/vendors/railway/new_user.md)  
[Northflank](/vendors/northflank/new_user.md)  
[Fly.io](/vendors/fly.io/new_user.md)  
[Azure](/vendors/azure/new_user.md)

## <u>VPS</u>

[Google Cloud](https://navid200.github.io/xDrip/docs/Nightscout/GoogleCloud.html)  
[Oracle Cloud](https://www.dropbox.com/s/5twlqrndofqno0t/0-amber-oracle.pdf)  
[Advanced DIY](/nightscout/advanced)
