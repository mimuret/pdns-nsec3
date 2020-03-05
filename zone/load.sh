#!/bin/bash

cd /zone

apt update && apt -y install dnsutils
zone2sql --gmysql | mysql -h db -u root --password=changeme pdns
pdnsutil set-nsec3 example.jp '1 0 5 209A33'
pdnsutil secure-zone example.jp
pdnsutil rectify-all-zones

dig @localhost example.jp axfr
