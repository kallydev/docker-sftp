#!/usr/bin/bash

function add_user() {
  useradd -g sftp -s /sbin/nologin -d /home/"$1" -m "$1"
  echo "$1:$2" | chpasswd
  chown root /home/"$1"
  chmod go-w /home/"$1"
  mkdir /home/"$1"/sftp
  chown "$1":sftp /home/"$1"/sftp
  chmod ug+rwX /home/"$1"/sftp
}

readarray -t user_array </etc/sftp/users.conf

groupadd sftp

for user in "${user_array[@]}"; do
  IFS=':' read -ra conf_array <<<"$user"
  if [ "$user" != "" ] && [ ${#conf_array[@]} != 2 ]; then
    echo "users.conf file error"
    exit 1
  fi
  add_user "${conf_array[0]}" "${conf_array[1]}"
done

exec /usr/sbin/sshd -D -e
