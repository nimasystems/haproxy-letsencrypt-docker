https://omarghader.github.io/haproxy-letsencrypt-docker-certbot-certificates/

# create empty dirs
mkdir -p ./letsencrypt
mkdir -p ./certs

# create dummy cert
./bin/create-dummy.cert.sh

# start project and make sure all is ok
docker-compose up

# Certbot
#

# dry run first
./bin/create-cert.sh test1.domain "test1.domain,test2.domain" user@domain.com --dry-run

# exec next
./bin/create-cert.sh test1.domain "test1.domain,test2.domain" user@domain.com

# check the generated cert
cat ./certs/test1.domain.pem

# delete the dummy cert
rm -rf ./certs/test.pem

# restart project
docker-compose down
docker-compose up

# Certbot renewal
#

# renew certificate
./bin/renew-certs.sh

# cron task (monthly)
0 0 1 * * ./bin/renew-certs.sh
