FROM python:alpine

RUN mkdir /gandi-ddns
COPY . /gandi-ddns/

RUN crontab -l | { cat; echo "2-59/15 * * * * python /gandi-ddns/gandi_ddns.py >> /var/log/cron.log 2>&1"; } | crontab -

RUN pip install -r /gandi-ddns/requirements.txt

RUN touch /var/log/cron.log

CMD crond && tail -f /var/log/cron.log