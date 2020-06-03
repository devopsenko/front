#!/bin/bash
echo -n 'Enter your SiteName: '
read sn
echo -n 'Enter your IP: '
read ip
echo -n 'Enter extension: '
read ext

function GS {
  sed "s/SITE/$sn/g" example_nginx_gs.conf > /etc/nginx/conf.d/$sn.conf
  sed -i "s/IPADDR/$ip/g" /etc/nginx/conf.d/$sn.conf
}
function GSHTML {
  sed "s/SITE/$sn/g" example_nginx_gs_html.conf > /etc/nginx/conf.d/$sn.conf
  sed -i "s/IPADDR/$ip/g" /etc/nginx/conf.d/$sn.conf
  sed -i "s/EXT/$ext/g" /etc/nginx/conf.d/$sn.conf
}
function WP {
  sed "s/SITE/$sn/g" example_nginx_wp.conf > /etc/nginx/conf.d/$sn.conf
  sed -i "s/IPADDR/$ip/g" /etc/nginx/conf.d/$sn.conf
}
function 0CONF {
  sed "s/IPADDR/$ip/g" 0.conf > /etc/nginx/conf.d/0.conf
}
function REDIRECT {
  sed "s/SITE/$sn/g" example_nginx_redirect.conf > /etc/nginx/conf.d/$sn.conf
  sed -i "s/IPADDR/$ip/g" /etc/nginx/conf.d/$sn.conf
}
while true
do
  echo -e " \n Select type content conf from $sn: \n \n   0.0CONF \n   1.GS \n   2.GSHTML \n   3.WP \n   4.REDIRECT \n \n"
  read -p "(0CONF/GS/GSHTML/WP/REDIRECT):" REMOTESH
  case $REMOTESH in
  [0] ) 0CONF; break;;
  [0][Cc][Oo][Nn][Ff] ) 0CONF; break;;
  [1] ) GS; break;;
  [Gg][Ss] ) GS; break;;
  [2] ) GSHTML; break;;
  [Gg][Ss][Hh][Tt][Mm][Ll] ) GSHTML; break;;
  [3] ) WP; break;;
  [Ww][Pp] ) WP; break;;
  [4] ) REDIRECT; break;;
  [Rr][Ee][Dd][Ii][Rr][Ee][Cc][Tt] ) REDIRECT; break;;
  * ) echo " ## ERROR:  Please select one from the list  ";;
  esac
done
