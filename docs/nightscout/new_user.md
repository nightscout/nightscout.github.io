# New Nightscout Users

<span style="font-size:larger;">*"What is great is there will be multiple options for those interested in setting up the system! #wearenotwaiting" J.A.*</span></span>

```{admonition} Too complicated? Not what you're looking for?
:class: seealso
Consider a hosted Nightscout service! Check for easier solutions [here](project:/index.md#nightscout-as-a-service).
```

```{admonition} Confusing?
:class: hint
**[Need help to choose?
Try the wizard](wizard)**.
<img src="/nightscout/img/wizard.png" />
```

## Basic concepts

Even if knowing how it works is not mandatory, it is very useful to understand a few background concepts before starting DIY Nightscout.

1. The **code** available open source in [GitHub](https://github.com/nightscout/cgm-remote-monitor) or packaged for you in [Docker](https://hub.docker.com/u/nightscout) is the set of instruction that will be used to make your Nightscout. You don't need to understand it or be a programmer to use it.
2. Your Nightscout will usually be running a **web application** in the internet cloud, meaning that somewhere on the planet, a computer or another will spend some of its time to keep your Nightscout active. This is the engine of Nightscout: it will make sure to be ready to accept the data you will send to it (BG, treatments, ...) or to answer to data requests when you ask them (BG, reports, ...) and even send alarms when instructed to do so. You will not see the engine work but you will see its frontpage: the web URL of your Nightscout site, which will be available on any device connected to the internet.
3. Since you will need to store a lot of data, Nightscout must have a **database**. This database will also be in the cloud, meaning data will be stored on one or more computers, somewhere. The Nightscout engine mentioned above will store and read data from this database whenever required.

<img src="./img/nselements.png"  width="600px" />

**From this you understand there are three main pieces necessary to build your Nightscout:**

1. **The Nightscout code also known as cgm-remote-monitor**
2. **A cloud platform running the Nightscout web app**
3. **A cloud database storing Nightscout data**

Some platforms offer both engine and database like Azure, Railway, Northflank and all VPS servers. But you can use an external database if you want. Some others like Heroku or Fly.io don't propose a database and require you to use an external one. Traditionally the database holding Nightscout data is hosted by another provider (mLab, now MongoDB Atlas) but it might not be the most reliable solution.

</br>  

## Building Nightscout DIY in a cloud platform

You can run your Nightscout site in several vendors platforms, using free or paid accounts.  Try the [wizard](wizard) to see which options can match your needs.

Below is a list of most used platforms. There are probably others, don't hesitate to [open an issue in the documentation](https://github.com/nightscout/nightscout.github.io/issues) with the easiest deployment method if you want to see them named here.

## Vendors comparison table

<head>
<style id="Book1_543_Styles"><!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
.xl65543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl66543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:white;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#404040;
	mso-pattern:black none;
	white-space:normal;}
.xl67543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:white;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	background:#404040;
	mso-pattern:black none;
	white-space:normal;}
.xl68543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:white;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	background:#404040;
	mso-pattern:black none;
	white-space:nowrap;}
.xl69543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:normal;}
.xl70543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:normal;}
.xl71543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:normal;}
.xl72543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:normal;}
.xl73543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:normal;}
.xl74543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:normal;}
.xl75543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:normal;}
.xl76543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:normal;}
.xl77543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:normal;}
.xl78543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:normal;}
.xl79543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:normal;}
.xl80543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCCCC;
	mso-pattern:black none;
	white-space:normal;}
.xl81543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:normal;}
.xl82543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:normal;}
.xl83543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:normal;}
.xl84543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:nowrap;}
.xl85543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:nowrap;}
.xl86543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:nowrap;}
.xl87543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:nowrap;}
.xl88543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:nowrap;}
.xl89543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:nowrap;}
.xl90543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:nowrap;}
.xl91543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:nowrap;}
.xl92543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:nowrap;}
.xl93543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:nowrap;}
.xl94543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:nowrap;}
.xl95543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:nowrap;}
.xl96543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl97543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl98543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl99543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl100543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl101543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:nowrap;}
.xl102543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:nowrap;}
.xl103543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:nowrap;}
.xl104543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl105543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl106543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl107543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl108543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"_\(\0022$\0022* \#\,\#\#0\.00_\)\;_\(\0022$\0022* \\\(\#\,\#\#0\.00\\\)\;_\(\0022$\0022* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl109543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\\ \[$€-1\]\;\[Red\]\\-\#\,\#\#0\\ \[$€-1\]";
	text-align:center;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl110543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"\0022$\0022\#\,\#\#0_\)\;\[Red\]\\\(\0022$\0022\#\,\#\#0\\\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
--></style>
</head>
<body>

<div id="Book1_543" align=center x:publishsource="Excel">
<table border=0 cellpadding=0 cellspacing=0 width=742 class=xl65543
 style='border-collapse:collapse;table-layout:fixed;width:558pt;box-sizing: inherit;
 border-spacing: 0px;display:inline-block;background-color:var(--md-default-bg-color);
 border:0.05rem solid var(--md-typeset-table-color);border-radius: 0.1rem;
 font-size:0.64rem;max-width:100%;touch-action: auto;color:rgba(0, 0, 0, 0.87);
 font-variant-ligatures: normal;font-variant-caps: normal;orphans: 2;
 text-align:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration-thickness: initial;
 text-decoration-style: initial;text-decoration-color: initial'>
 <col class=xl96543 width=113 style='mso-width-source:userset;mso-width-alt:
 3612;width:85pt'>
 <col class=xl96543 width=142 style='mso-width-source:userset;mso-width-alt:
 4551;width:107pt'>
 <col class=xl96543 width=72 style='mso-width-source:userset;mso-width-alt:
 2304;width:54pt'>
 <col class=xl96543 width=94 style='mso-width-source:userset;mso-width-alt:
 3015;width:71pt'>
 <col class=xl65543 width=321 style='mso-width-source:userset;mso-width-alt:
 10268;width:241pt'>
 <tr height=21 style='height:16.0pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=21 class=xl66543 width=113 style='height:16.0pt;width:85pt;
  box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Vendor</td>
  <td class=xl67543 width=142 style='width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Cost/month</td>
  <td class=xl67543 width=72 style='width:54pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>Database</td>
  <td class=xl67543 width=94 style='width:71pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>Complexity</td>
  <td class=xl68543 width=321 style='width:241pt'>Limitations</td>
 </tr>
 <tr height=25 style='height:18.7pt'>
  <td colspan=5 height=25 class=xl101543 style='border-right:1.0pt solid black;
  height:18.7pt'>Hosted solutions</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=20 class=xl74543 width=113 style='height:15.35pt;border-top:none;
  width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>T1Pal</td>
  <td class=xl108543 width=142 style='border-top:none;width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'><span
  style='mso-spacerun:yes'> </span>11.99$<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Yes</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Low</td>
  <td class=xl105543 style='border-top:none'>Loop remote carbs/bolus require
  extra service</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=20 class=xl74543 width=113 style='height:15.35pt;border-top:none;
  width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>NS10BE</td>
  <td class=xl108543 width=142 style='border-top:none;width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'><span
  style='mso-spacerun:yes'> </span>&lt; 5€<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Yes</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Low</td>
  <td class=xl105543 style='border-top:none'>&nbsp;</td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td height=21 class=xl69543 width=113 style='height:16.0pt;width:85pt'>Nightscout
  Pro</td>
  <td class=xl109543 width=142 style='width:107pt'>3£</td>
  <td class=xl97543 width=72 style='width:54pt'>Yes</td>
  <td class=xl97543 width=94 style='width:71pt'>Low</td>
  <td class=xl98543>&nbsp;</td>
 </tr>
 <tr height=25 style='height:18.7pt'>
  <td colspan=5 height=25 class=xl84543 style='border-right:1.0pt solid black;
  height:18.7pt'>Platforms as a service</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td rowspan=2 height=40 class=xl75543 width=113 style='border-bottom:.5pt solid black;
  height:30.7pt;border-top:none;width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Heroku</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>5$ Eco plan</td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>No</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl105543 style='border-top:none'>Will sleep without an active
  up/downloader</td>
 </tr>
 <tr height=20 style='height:15.35pt'>
  <td height=20 class=xl106543 width=142 style='height:15.35pt;width:107pt'>7$
  Basic plan</td>
  <td class=xl106543 width=72 style='width:54pt'>No</td>
  <td class=xl106543 width=94 style='width:71pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl107543>&nbsp;</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=20 class=xl77543 width=113 style='height:15.35pt;border-top:none;
  width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Azure</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Free Basic plan</td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Issues</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl105543 style='border-top:none'>Basic B1 is too limited for FAPSX</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=20 class=xl77543 width=113 style='height:15.35pt;border-top:none;
  width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Railway</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>5$ Hobby plan</td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Yes</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl105543 style='border-top:none'>Some followers experience issues</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=20 class=xl77543 width=113 style='height:15.35pt;border-top:none;
  width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Northflank</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt'>Free
  Developer plan</td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Yes</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl105543 style='border-top:none'>&nbsp;</td>
 </tr>
 <tr height=21 style='height:16.0pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=21 class=xl70543 width=113 style='height:16.0pt;width:85pt;
  box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Fly.io</td>
  <td class=xl99543 width=142 style='width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Free Hobby plan</td>
  <td class=xl99543 width=72 style='width:54pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>No</td>
  <td class=xl99543 width=94 style='width:71pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>High</td>
  <td class=xl100543>&nbsp;</td>
 </tr>
 <tr height=25 style='height:18.7pt'>
  <td colspan=5 height=25 class=xl87543 style='border-right:1.0pt solid black;
  height:18.7pt'>Databases</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td rowspan=2 height=40 class=xl78543 width=113 style='border-bottom:.5pt solid black;
  height:30.7pt;border-top:none;width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Atlas</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Free M0 tier</td>
  <td class=xl80543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>512MB</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl105543 style='border-top:none'>Very small for Loop/AAPS</td>
 </tr>
 <tr height=20 style='height:15.35pt'>
  <td height=20 class=xl110543 width=142 style='height:15.35pt;width:107pt'>9$
  M2 tier</td>
  <td class=xl106543 width=72 style='width:54pt'></td>
  <td class=xl106543 width=94 style='width:71pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl107543>Not worth the cost compared to hosted solutions</td>
 </tr>
 <tr height=20 style='height:15.35pt'>
  <td height=20 class=xl81543 width=113 style='height:15.35pt;border-top:none;
  width:85pt'>Azure</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt'>Free Basic
  plan</td>
  <td class=xl80543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Issues</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl105543 style='border-top:none'>Cosmos is not supported correctly</td>
 </tr>
 <tr height=20 style='height:15.35pt'>
  <td height=20 class=xl81543 width=113 style='height:15.35pt;border-top:none;
  width:85pt'>Railway</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt'>10$/GB</td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'></td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl105543 style='border-top:none'>&nbsp;</td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td height=21 class=xl71543 width=113 style='height:16.0pt;width:85pt'>Northflank</td>
  <td class=xl99543 width=142 style='width:107pt'>0.3$/GB</td>
  <td class=xl97543 width=72 style='width:54pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'></td>
  <td class=xl99543 width=94 style='width:71pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl100543>&nbsp;</td>
 </tr>
 <tr height=25 style='height:18.7pt'>
  <td colspan=5 height=25 class=xl90543 style='border-right:1.0pt solid black;
  height:18.7pt'>Virtual private servers</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=20 class=xl82543 width=113 style='height:15.35pt;border-top:none;
  width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Google
  Cloud</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Free e2-micro tier</td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Yes</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Medium</td>
  <td class=xl105543 style='border-top:none'>Access from Australia and China is
  not free</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=20 class=xl82543 width=113 style='height:15.35pt;border-top:none;
  width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Oracle</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Free E2.1 micro tier</td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Yes</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>High</td>
  <td class=xl105543 style='border-top:none'>&nbsp;</td>
 </tr>
 <tr height=21 style='height:16.0pt'>
  <td height=21 class=xl72543 width=113 style='height:16.0pt;width:85pt'>VPS</td>
  <td class=xl99543 width=142 style='width:107pt'>1$ -&gt; ?</td>
  <td class=xl99543 width=72 style='width:54pt'>Yes</td>
  <td class=xl99543 width=94 style='width:71pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>High</td>
  <td class=xl100543>&nbsp;</td>
 </tr>
 <tr height=25 style='height:18.7pt'>
  <td colspan=5 height=25 class=xl93543 style='border-right:1.0pt solid black;
  height:18.7pt'>Hardware solutions</td>
 </tr>
 <tr height=20 style='height:15.35pt;box-sizing: inherit;transition: background-color 125ms ease 0s'>
  <td height=20 class=xl83543 width=113 style='height:15.35pt;border-top:none;
  width:85pt;box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Raspberry
  Pi</td>
  <td class=xl104543 width=142 style='border-top:none;width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Hardware</td>
  <td class=xl104543 width=72 style='border-top:none;width:54pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Yes</td>
  <td class=xl104543 width=94 style='border-top:none;width:71pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>High</td>
  <td class=xl105543 style='border-top:none'>&nbsp;</td>
 </tr>
 <tr height=21 style='height:16.0pt;box-sizing: inherit;transition: background-color 125ms ease 0s;
  background-color:rgba(0, 0, 0, 0.035);box-shadow: 0 0.05rem 0 var(--md-default-bg-color) inset'>
  <td height=21 class=xl73543 width=113 style='height:16.0pt;width:85pt;
  box-sizing: inherit;border-top:0.05rem solid var(--md-typeset-table-color)'>Synology</td>
  <td class=xl99543 width=142 style='width:107pt;box-sizing: inherit;
  border-top:0.05rem solid var(--md-typeset-table-color)'>Hardware</td>
  <td class=xl99543 width=72 style='width:54pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>Yes</td>
  <td class=xl99543 width=94 style='width:71pt;box-sizing: inherit;border-top:
  0.05rem solid var(--md-typeset-table-color)'>High</td>
  <td class=xl100543>&nbsp;</td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=113 style='width:85pt'></td>
  <td width=142 style='width:107pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=94 style='width:71pt'></td>
  <td width=321 style='width:241pt'></td>
 </tr>
 <![endif]>
</table>
</div>


</body>

</br>

## Security and safekeeping

<head>
<style id="Book1_543_Styles"><!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
.xl65543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl66543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:white;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#404040;
	mso-pattern:black none;
	white-space:normal;}
.xl67543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:white;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	background:#404040;
	mso-pattern:black none;
	white-space:normal;}
.xl68543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:white;
	font-size:11.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	background:#404040;
	mso-pattern:black none;
	white-space:nowrap;}
.xl69543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:normal;}
.xl70543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:normal;}
.xl71543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:normal;}
.xl72543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:normal;}
.xl73543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:normal;}
.xl74543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:normal;}
.xl75543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:normal;}
.xl76543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:normal;}
.xl77543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:normal;}
.xl78543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:none;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:normal;}
.xl79543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:normal;}
.xl80543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFCCCC;
	mso-pattern:black none;
	white-space:normal;}
.xl81543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:normal;}
.xl82543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:normal;}
.xl83543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:normal;}
.xl84543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:nowrap;}
.xl85543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:nowrap;}
.xl86543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#B4C6E7;
	mso-pattern:black none;
	white-space:nowrap;}
.xl87543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:nowrap;}
.xl88543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:nowrap;}
.xl89543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#D6DCE4;
	mso-pattern:black none;
	white-space:nowrap;}
.xl90543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:nowrap;}
.xl91543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:nowrap;}
.xl92543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FFF2CC;
	mso-pattern:black none;
	white-space:nowrap;}
.xl93543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:nowrap;}
.xl94543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:nowrap;}
.xl95543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#F8CBAD;
	mso-pattern:black none;
	white-space:nowrap;}
.xl96543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl97543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl98543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:none;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl99543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl100543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:1.0pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl101543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:1.0pt solid windowtext;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:nowrap;}
.xl102543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:nowrap;}
.xl103543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:14.0pt;
	font-weight:700;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:1.0pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#E2EFDA;
	mso-pattern:black none;
	white-space:nowrap;}
.xl104543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl105543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl106543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl107543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:middle;
	border-top:none;
	border-right:1.0pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl108543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"_\(\0022$\0022* \#\,\#\#0\.00_\)\;_\(\0022$\0022* \\\(\#\,\#\#0\.00\\\)\;_\(\0022$\0022* \0022-\0022??_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl109543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"\#\,\#\#0\\ \[$€-1\]\;\[Red\]\\-\#\,\#\#0\\ \[$€-1\]";
	text-align:center;
	vertical-align:middle;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl110543
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Roboto;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:"\0022$\0022\#\,\#\#0_\)\;\[Red\]\\\(\0022$\0022\#\,\#\#0\\\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
--></style>
</head>

- Do not use the same password for all your accounts, and choose passwords that are not easy to guess.
- Do not use the `API_SECRET` for the Atlas database password.
- Do not use your Dexcom or CareLink user name or password for Nightscout components.
- Do not share the `API_SECRET` or other passwords of your accounts to others.
- Do not use Nightscout or any related applications on rooted and/or otherwise compromised devices, and ensure you always have the latest operating system and virus protection updates installed.

If you want to read more about Nightscout security, including about additional configuration options to make your installation more secure, please check our [security guide](/nightscout/security.md).

</br>
