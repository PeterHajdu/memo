# Some useful commands

```
pfctl -t pfbadhost -T show #show table
pfctl -t pfbadhost -T add 192.16.42.52
pfctl -t pfbadhost -T add 195.11.0.0/16
pfctl -t pfbadhost -T delete 192.168.0.0/16
pfctl -t pfbadhost -T test 192.16.42.52
```
