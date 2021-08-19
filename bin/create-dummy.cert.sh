openssl req -nodes -x509 -newkey rsa:2048 -keyout test.key -out test.crt -days 30 && cat test.key test.crt > ./certs/test.pem && rm -rf test.key && rm -rf test.crt
