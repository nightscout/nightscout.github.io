# Using DDNS to your Nightscout site

</br>

Either because running a VPS, Northflank or simply because you'd like an alternate name to your Nightscout page, you can use either you own DNS name or free services like those below.

</br>

## No-IP

No-IP provides one free dynamic DNS hostname. Using No-IP for free requires you to **confirm your hostname every month**.

1. Sign up to [No-IP](https://www.noip.com/sign-up). Do not create a `Hostname` yet.
2. From the dashboard, in `Dynamic DNS`, `No-IP hostnames` click `Create Hostname`.  
   <img src="../img/DNS01.png" style="zoom:80%;" >
3. Invent your `Hostname` and select a `Domain` in the `Free Domain` list. This will be the URL you will be able to browse from any computer to your Nightscout site.  
   <img src="../img/DNS02.png" style="zoom:80%;" >
4. If you're using a VPS or you know the IP address of your current Nightscout, select `DNS Host (A)` and enter it in `IPv4 Address`.  
   <img src="../img/DNS03.png" style="zoom:80%;" >
5. Else, if you only know your current Nightscout site name, select `DNS Alias (CNAME)` and enter it in `Target`.  
   <img src="../img/DNS04.png" style="zoom:80%;" >
6. Click `Create Hostname` bottom right.

You now can use this URL when accessing your Nightscout site, in any browser and also for your uploaders and followers.

</br>

## Dynu

1. Sign up to [Dynu](https://www.dynu.com/en-US/ControlPanel/CreateAccount).
2. From the `Control Panel`, select `DDNS Services`.  
   <img src="../img/DNS05.png" style="zoom:80%;" >
3. Invent your `Host` name and select a `Top Level` domain in the list. This will be the URL you will be able to browse from any computer to your Nightscout site.  
   <img src="../img/DNS06.png" style="zoom:80%;" >
4. Click `Add`.
5. Replace the proposed IP address in `IPv4 Address` by your own Nightscout IP, (you can disable IPv6 features) and click `Save`.  
   <img src="../img/DNS07.png" style="zoom:80%;" >

You now can use this URL when accessing your Nightscout site, in any browser and also for your uploaders and followers.

</br>

## FreeDNS

FreeDNS proposes thousands of free DNS names, with the issue that many are flagged as dangerous when you'll want to browse them from your cellular or within public/private networks. You'll find one that fits your needs but you might need several attempts.

1. Sign up to [FreeDNS](https://freedns.afraid.org/signup/?plan=starter). Enter all required information and click `Send activation email`.  
   <img src="../img/DNS08.png" style="zoom:80%;" >
2. Check your inbox (search Spam if you don't receive the email) and click on the activation link.  
   <img src="../img/DNS09.png" style="zoom:80%;" >
3. Select `Subdomains` in the menu, then `Add a subdomain`.  
   <img src="../img/DNS10.png" style="zoom:80%;" >
4. Invent your host name in `Subdomain`, select a domain name in the list (there are more than you can see) and put your Nightscout IP in the `Destination` field. Write the text in the image and click `Save`.  
   <img src="../img/DNS11.png" style="zoom:80%;" >  
   Note: you might want to select a less popular name than those proposed by selecting Registry in the left menu (example below for us.to).  
   <img src="../img/DNS12.png" style="zoom:80%;" > 
5. You now can use this URL when accessing your Nightscout site, in any browser and also for your uploaders and followers.  
   <img src="../img/DNS13.png" style="zoom:80%;" > 

</br>