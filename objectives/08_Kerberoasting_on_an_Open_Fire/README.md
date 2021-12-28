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

Eve Snowshoes:

> Fantastic! Thanks for the help!  Hey, would you like to know more about
> Kerberoasting and Active Directory permissions abuse?  There's a great
> [talk][chris-davis-talk] by Chris Davis on this exact subject!  There are
> also plenty of resources available to learn more about
> [Kerberoasting][kerberoasting] specifically.  If you have any trouble finding
> the domain controller on the 10.X.X.X network, remember that, when not
> running as root, nmap default probing relies on connecting to TCP 80 and 443.
> Got a hash that won't crack with your wordlist?
> [OneRuleToRuleThemAll.rule][onetorulethemall] is a great way to grow your
> keyspace.  Where'd you get your wordlist? [CeWL][cewl] might generate a great
> wordlist from the ElfU website, but it will ignore digits in terms by
> default.  So, apropos of nothing, have you ever known system administrators
> who store credentials in scripts? I know, I know, you understand the folly
> and would never do it!  The easy way to investigate Active Directory
> misconfigurations (for Blue and Red alike!) is with [Bloodhound][bloodhound],
> but there are [native][native] [methods][methods] as well.  Oh, and one last
> thing: once you've granted permissions to your user, it might take up to five
> minutes for it to propogate throughout the domain.

[chris-davis-talk]: https://www.youtube.com/watch?v=iMh8FTzepU4
[kerberoasting]: https://gist.github.com/TarlogicSecurity/2f221924fef8c14a1d8e29f3cb5c5c4a
[onetorulethemall]: https://github.com/NotSoSecure/password_cracking_rules
[cewl]: https://github.com/digininja/CeWL
[bloodhound]: https://github.com/BloodHoundAD/BloodHound
[native]: https://social.technet.microsoft.com/Forums/en-US/df3bfd33-c070-4a9c-be98-c4da6e591a0a/forum-faq-using-powershell-to-assign-permissions-on-active-directory-objects?forum=winserverpowershell
[methods]: https://www.specterops.io/assets/resources/an_ace_up_the_sleeve.pdf
