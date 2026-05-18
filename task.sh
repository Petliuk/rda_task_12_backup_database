#!/bin/bash

set -e

mysqldump -u"${DB_USER}" -p"${DB_PASSWORD}" ShopDB \
  | sed -e 's/`ShopDB`/`ShopDBReserve`/g' \
  | mysql -u"${DB_USER}" -p"${DB_PASSWORD}"

mysqldump -u"${DB_USER}" -p"${DB_PASSWORD}" --no-create-info --skip-triggers ShopDB \
  | sed -e 's/`ShopDB`/`ShopDBDevelopment`/g' \
  | mysql -u"${DB_USER}" -p"${DB_PASSWORD}"
