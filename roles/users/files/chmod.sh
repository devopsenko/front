chgrp -R ftpusers /var/www/html
chmod -R 775 /var/www/html
find /var/www/html/ -name data -exec chmod -R 777 {} \;
find /var/www/html/ -name theme -exec chmod -R 777 {} \;
find /var/www/html/ -name news -exec chmod -R 777 {} \;
find /var/www/html/ -name sitemap.xml -exec chmod -R 777 {} \;
find /var/www/html/ -name blog -exec chmod -R 777 {} \;