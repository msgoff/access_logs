while read f;
  do echo iptables -I INPUT -s  $f -j DROP ;
  done < <(cat auth.log |grep ssh|grep fail|tr " " "\n"|grep rhost|sed -re 's/.*?=//g'|sort |uniq -c|sort -n|awk '$1 > 10'|tr " " "\n"|grep "\.")
