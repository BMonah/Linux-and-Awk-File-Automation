#!/bin/bash/expect
set timeout 10
set useful [lindex $argv 0]
set yesterday [lindex $argv 1]
set month [lindex $argv 2]

spawn scp /path/to/file/controlfile_$month.csv /path/to/file//count_$yesterday.csv /path/to/file/count_$yesterday.csv /home/bdibill/backup/filemonitor/balance_count_$yesterday.csv infauser@172.29.213.232:/staging_area/dop/control_file
expect "password: "
send -- "$useful\n"
expect eof
