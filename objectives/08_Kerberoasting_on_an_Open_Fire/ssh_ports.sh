
ssh -L 127.0.0.1:389:10.128.1.53:389 \
    -L 127.0.0.1:88:10.128.1.53:88  \
    -L 127.0.0.1:135:10.128.1.53:135  \
    psmifmgudo@grades.elfu.org -p 2222

# Nmap scan report for hhc21-windows-dc.c.holidayhack2021.internal
# PORT     STATE SERVICE
# 53/tcp   open  domain
# 88/tcp   open  kerberos-sec
# 135/tcp  open  msrpc
# 139/tcp  open  netbios-ssn
# 389/tcp  open  ldap
# 445/tcp  open  microsoft-ds
# 464/tcp  open  kpasswd5
# 593/tcp  open  http-rpc-epmap
# 636/tcp  open  ldapssl
# 3268/tcp open  globalcatLDAP
# 3269/tcp open  globalcatLDAPssl
# 3389/tcp open  ms-wbt-server
