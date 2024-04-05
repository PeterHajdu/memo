# pf

## after install setup

/etc/pf.conf
```
tcp_pass = "{22}"
block log

pass in proto icmp
pass in on egress proto tcp to port $tcp_pass
pass out
```

## next steps

 * https://www.geoghegan.ca/pfbadhost.html
 * https://si3t.ch/ah/en/02-admin/#_13_sshguard

## useful commands

```
pfctl -f /etc/pf.conf #reload rules
pfctl -F all #empty firewall rules
pfctl -sr #list all active rules
```

```
pfctl -t pfbadhost -T show #show table
pfctl -t pfbadhost -T add 192.16.42.52
pfctl -t pfbadhost -T add 195.11.0.0/16
pfctl -t pfbadhost -T delete 192.168.0.0/16
pfctl -t pfbadhost -T test 192.16.42.52
```
