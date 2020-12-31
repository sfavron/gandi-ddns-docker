Python script to update DNS A record of your domain dynamically using gandi.net LiveDNS API:

http://doc.livedns.gandi.net/

The script was developed for those behind a dynamic IP interface (e.g. home server/pi/nas).

Configuration is through the following environment variables:

```
GANDI_API_KEY
GANDI_DOMAIN
GANDI_A_NAME=@
GANDI_TTL=900
GANDI_API=https://dns.api.gandi.net/api/v5/
IPIFY_RETRIES=3
IPIFY_API=https://api.ipify.org
```

Every time the script runs, it will query an external service to retrieve the external IP of the machine, compare it to the current A record in the zone at gandi.net, and then update the record if the IP has changed.

Requirements: 

  pip install -r requirements.txt

You can then run the script as a cron job :

```
*/15 * * * * python /home/user/gandi_ddns.py
```

But to be nice to the API servers, you should choose a random offset for your job. For example to run at 2 minutes after the hour, and then every 15 minutes :

```
2-59/15 * * * * python /home/user/gandi-ddns.py
```
