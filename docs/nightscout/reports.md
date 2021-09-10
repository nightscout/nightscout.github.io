# Reports

Nightscout offers some fantastic data-crunching report tools in the drawer menu, 

<img src="../img/UseNS21.png" style="zoom:80%;" />

</br>

Select `Reports` to open the reports page.

<img src="../img/Reports00.png" style="zoom:80%;" />

</br>

First select the report type you'd like to see (see below for an overview).

`Day to day`, `Week to week`, `Daily Stats`, `Distribution`, `Hourly stats`, `Percentile Chart`, `Weekly Distribution`, `Calibrations`, `Treatments`, `Profiles` or `Loopalyzer`

Then select the period for which you want your data analyzed.

Enable the check box and either select `From:` and `To: `dates or `Today`, `Last 2 days`, `Last 3 days`, `Last week`, `Last 2 weeks`, `Last Month`, `Last 3 months`.

<img src="../img/Reports01.png" style="zoom:80%;" />

</br>

You can filter your data using key `Notes` or `Event type` (select one in the drop down list).

<img src="../img/Reports02.png" style="zoom:80%;" />

</br>

You can select which week days to use in order to better analyze patterns.

<img src="../img/Reports03.png" style="zoom:80%;" />

</br>

Confirm your `Target BT range` `bottom` and `top` for your TIR and graph range lines.

You can also sort the report from older to newer or newer first.

<img src="../img/Reports04.png" style="zoom:80%;" />

</br>

Click `SHOW` and wait for data to load and rendering to complete. This might take some time if the period is long.

<img src="../img/Reports05.png" style="zoom:80%;" />

</br>

### Day To day

This report will show your BG, day by day, including the treatments you select.

<img src="../img/Reports06.png" style="zoom:80%;" />

</br>

If you want to change selections, you need to click again `SHOW` to update the view.

<img src="../img/Reports07.png" style="zoom:80%;" />

</br>

If you select `Insulin distribution` you will get a short report.

Note: You need `Basal rate` enabled to see bolus vs basal information.

<img src="../img/Reports08.png" style="zoom:80%;" />

</br>

You can change the vertical scale to `Logarithmic` or `Linear`.

You can change the graph `Size`.

<img src="../img/Reports09.png" style="zoom:80%;" />

</br>

### Week to Week

This report will give you a week by week view, with color code for week days selected.

<img src="../img/Reports10.png" style="zoom:80%;" />

</br>

### Daily stats

This report will give you a daily distribution view.

<img src="../img/Reports11.png" style="zoom:80%;" />

</br>

### Distribution

This report will give you a complete distribution view with a lot of information on the dates range you selected.

You also can filter by hours (scroll to the bottom of the page).

<img src="../img/Reports18.png" style="zoom:80%;" />

<img src="../img/Reports12.png" style="zoom:80%;" />

A1c is only a rough estimation that can be very inaccurate and does not replace actual blood testing. The formula used is taken from:Nathan, David M., et al. "Translating the A1C assay into estimated average glucose values." *Diabetes care* 31.8 (2008): 1473-1478.

Time in fluctuation and Time in rapid fluctuation measure the % of time during the examined period, during which the blood glucose has been changing relatively fast or rapidly. Lower values are better.

Mean Total Daily Change is a sum of the absolute value of all glucose excursions for the examined period, divided by the number of days. Lower is better.

Mean Hourly Change is a sum of the absolute value of all glucose excursions for the examined period, divided by the number of hours in the period. Lower is better.

Out of Range RMS is calculated by squaring the distance out of range for all glucose readings for the examined period, summing them, dividing by the count and taking the square root. This metric is similar to in-range percentage but weights readings far out of range higher. Lower values are better.

GVI (Glycemic Variability Index) and PGS (Patient Glycemic Status) are measures developed by Dexcom, detailed [can be found here](https://web.archive.org/web/20160523152519/http://www.healthline.com/diabetesmine/a-new-view-of-glycemic-variability-how-long-is-your-line).

</br>

### Hourly stats

This report will give you an hourly distribution view with a box plot and additional hour by hour statistics.

<img src="../img/Reports13.png" style="zoom:80%;" />

</br>

### Percentile Chart

This report will give you an percentile distribution view of the range you selected.

<img src="../img/Reports16.png" style="zoom:80%;" />

</br>

### Weekly Distribution

This report will give you an weekly view of your statistics.

<img src="../img/Reports14.png" style="zoom:80%;" />

</br>

### Calibrations

This will give you a a table of your calibrations, if your uploader sends the correct event and data.

</br>

### Treatments

This will give you a a table of your treatments, day by day.

<img src="../img/Reports15.png" style="zoom:80%;" />

</br>

### Profiles

This report will display [profiles](../nightscout/profile_editor.md) used in the time range.

<img src="../img/Reports17.png" style="zoom:60%;" />

</br>

### Loopalyzer

Loopalyzer is an utility made to help analyze and tune closed loop systems. It may work with other setups as well, both closed and open loop, and non loop. 

Select the period on which you want to run the report then click `Show`. A set of graphs will display top to bottom your basal profile, blood glucose, loop deviation from basal (that should be minimized for an optimized closed loop system), insulin on board and carbs on board. On the last two graphs, treatments are represented by vertical black bars.

<img src="../img/Reports19.png" style="zoom:60%;" />

</br>

Using the dedicated menu you can display your profiles below the graph and use `Timeshift`. Click `Show` to update the display when changing the options.

You can navigate day to day with `< Previous day` and `Next day >` or by period length with `<< Previous` and `Next >>` (i.e. if you selected a week it will go backwards and forward week by week).

 <img src="../img/Reports20.png" style="zoom:60%;" />

`Timeshift` will allow you to  synchronize meals within a time range in order to better analyze your data. Obviously the rest of the day will not make sense since the shift only highlights the time range you are analyzing now. For example below: dinner analysis.

<img src="../img/Reports21.png" style="zoom:60%;" />

</br>

You might also be interested by [AutoTune](https://autotuneweb.azurewebsites.net/).

</br>

# Nightscout Reporter

[https://nightscout-reporter.zreptil.de/](https://nightscout-reporter.zreptil.de/) can be used to generate PDF documents with the data stored at Nightscout.

You need to add [`cors`](../setup_variables/#cors-cors) to your [`ENABLE`](../setup_variables/#enable) variables

Facebook group [Nightscout Reporter](https://www.facebook.com/nightrep)

</br>

# Power BI

Facebook group [Nightscout Power BI Reporting](https://www.facebook.com/groups/857487091295727)
