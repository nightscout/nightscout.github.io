# Building your Nightscout site in Ubuntu with a script

A scripted simple deployment not requiring computer skills.

Written by the xDrip+ developers.

[https://navid200.github.io/xDrip/docs/Nightscout/GoogleCloud.html](https://navid200.github.io/xDrip/docs/Nightscout/GoogleCloud.html)

</br>

**Note:** you can use this script in various VPS running Ubuntu 20.04.  
Obviously, the status menu that has been customized for the Google Cloud free tier will not report correct information.

- Tested successfully with Digital Ocean Regular Droplet.
- With Vultr Regular you need to exit to shell after Install phase 1 and open the firewall for Nginx:

```
sudo ufw allow 'Nginx Full' 
```

<!-- https://github.com/jamorham/nightscout-vps -->