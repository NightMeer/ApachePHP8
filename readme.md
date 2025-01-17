PHP8 Apache Docker

docker-compose.yml
```
services:
  apache:
    image: ghcr.io/nightmeer/apachephp8:latest
    ports:
      - 80:80
    volumes:
      - ./apache/config:/config
      - ./apache/html:/var/www/html

```
Docker Start
```
docker run --restart unless-stopped -d -p 80:80 -v /HOST/PATH/config/:/config -v /HOST/PATH/config/html:/var/www/html ghcr.io/nightmeer/apachephp8:latest
```


Installed and Loaded PHP Extensions (via get_loaded_extensions())
```
    [0] => Core
    [1] => date
    [2] => libxml
    [3] => openssl
    [4] => pcre
    [5] => sqlite3
    [6] => zlib
    [7] => ctype
    [8] => curl
    [9] => dom
    [10] => fileinfo
    [11] => filter
    [12] => ftp
    [13] => hash
    [14] => iconv
    [15] => json
    [16] => mbstring
    [17] => SPL
    [18] => session
    [19] => PDO
    [20] => pdo_sqlite
    [21] => standard
    [22] => posix
    [23] => random
    [24] => Reflection
    [25] => Phar
    [26] => SimpleXML
    [27] => tokenizer
    [28] => xml
    [29] => xmlreader
    [30] => xmlwriter
    [31] => mysqlnd
    [32] => apache2handler
    [33] => gd
    [34] => gmp
    [35] => intl
    [36] => mysqli
    [37] => pcntl
    [38] => pdo_mysql
    [39] => pdo_pgsql
    [40] => pgsql
    [41] => sodium
    [42] => zip
```