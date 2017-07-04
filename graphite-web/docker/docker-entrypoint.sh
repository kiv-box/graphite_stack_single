#!/bin/sh

export PYTHONPATH="/opt/graphite/webapp:/opt/graphite/webapp/graphite"

if [ -f /opt/graphite/conf/graphite_wsgi.py ]
then
    ln -s /opt/graphite/conf/graphite_wsgi.py /opt/graphite/webapp/graphite/graphite_wsgi.py
else
    cp /opt/graphite/conf/graphite.wsgi.example /opt/graphite/webapp/graphite/graphite_wsgi.py
fi

if [ -f /opt/graphite/conf/local_settings.py ]
then
    ln -s /opt/graphite/conf/local_settings.py /opt/graphite/webapp/graphite/
fi

if [ ! -f /opt/graphite/webapp/graphite/local_settings.py ]
then
    cp /opt/graphite/webapp/graphite/local_settings.py.example /opt/graphite/webapp/graphite/local_settings.py
    sed -i "s/^#SECRET_KEY.*/SECRET_KEY=\'$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1)\'/" /opt/graphite/webapp/graphite/local_settings.py
fi

if [ ! -f /opt/graphite/storage/graphite.db ]
then
    cd /opt/graphite/webapp/graphite
    echo 'Generate static'
    django-admin.py collectstatic --settings=graphite.settings --no-input
    echo 'Apply migration'
    django-admin.py makemigrations account events dashboard url_shortener --settings=graphite.settings --no-input
    django-admin.py migrate --settings=graphite.settings
    echo 'Add defsult user'

    django-admin.py loaddata --settings=graphite.settings initial_data.json
fi

if [ $# -eq 0 ]
then
    echo "Auto run"
    /usr/bin/supervisord
else
    echo "Custom run"
    $@
fi
