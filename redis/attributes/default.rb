default[:redis][:bind]         = "127.0.0.1"
default[:redis][:port]         = "6379"
default[:redis][:config_path]  = "/etc/redis/redis.conf"
default[:redis][:daemonize]    = "no"
default[:redis][:timeout]      = "300"
default[:redis][:loglevel]     = "notice"
default[:redis][:password]     = nil

default[:redis][:monit][:rules] = [
  'totalmem > 30% for 10 cycles then restart',
  '5 restarts within 5 cycles then timeout'
]
