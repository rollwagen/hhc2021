# 8) Kerberoasting on an Open Fire

_Difficulty:_  :evergreen_tree: :evergreen_tree: :evergreen_tree: \
  :evergreen_tree: :evergreen_tree:

> Obtain the secret sleigh research document from a host on the Elf University
> domain. What is the first secret ingredient Santa urges each elf and reindeer
> to consider for a wonderful holiday season? Start by registering as a student
> on the ElfU Portal. Find _Eve Snowshoes_ in Santa's office for hints.

[ElfU Portal](https://register.elfu.org/)

Eve Snowshoes

> Hey there, how's it going? I'm Eve Snowshoes.  Lately I've been spending a
> lot of cycles worrying about what's going on next door.  Before that, I was
> checking out Fail2Ban.  It's this slick log scanning tool for Apache web
> servers.  If you can complete this terminal challenge, I’d be happy to give
> you some things I’ve learned about Kerberoasting and Active Directory
> permissions!  Why don't you do some work with Fail2Ban on this Cranberry Pi
> terminal first, then we’ll talk Kerberoasting and Active Directory. OK?

```text
ElfU Registration Portal
New Student Domain Account Creation Successful!  You can now access the student
network grading system by SSH'ing into this asset using the command below:

ssh lguphvnejd@grades.elfu.org -p 2222

ElfU Domain Username: lguphvnejd
ElfU Domain Password: Cjeblycko!
```

```text
2021-12-28 17:42:35 Login from 197.97.249.10 successful
2021-12-28 17:42:36 44.167.29.212: Request completed successfully
2021-12-28 17:42:36 Valid heartbeat from 51.171.20.230
2021-12-28 17:42:37 16.236.241.10: Request completed successfully
2021-12-28 17:42:37 Login from 196.50.240.87 successful
2021-12-28 17:42:37 Valid heartbeat from 120.181.218.234
2021-12-28 17:42:38 Login from 20.34.6.37 successful
2021-12-28 17:42:38 Valid heartbeat from 137.205.167.229
...
```

```sh
cat <<EOF > /etc/fail2ban/filter.d/filter_hohoho.conf
[Definition]
failregex = Failed login from <HOST> for .*$
            Login from <HOST> rejected due to unknown user name$
            Invalid heartbeat .* from <HOST>$
            <HOST> sent a malformed request?
EOF

cat <<EOF > /etc/fail2ban/action.d/action_hohoho.conf
[Definition]
actionban = /root/naughtylist add <ip>
actionunban = /root/naughtylist del <ip>
actionstop =  /root/naughtylist clear
EOF

cat <<EOF > /etc/fail2ban/jail.d/jail_hohoho.conf
[hohoho_jail]
enabled = true
logpath = /var/log/hohono.log
findtime = 60m
maxretry = 10
filter = filter_hohoho
action = action_hohoho
EOF

fail2ban-client -d

# fail2ban-regex /var/log/hohono.log \
     /etc/fail2ban/filter.d/filter_hohoho.conf
```

![fail2ban](img/fail2ban.png)
