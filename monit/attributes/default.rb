default[:monit] ||= {}

default[:monit][:alert_emails] = %w( root@localhost )
default[:monit][:logfile]      = "/var/log/monit.log"
