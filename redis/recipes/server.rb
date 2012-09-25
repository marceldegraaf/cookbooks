package "redis-server"

service "redis" do
  start_command "/etc/init.d/redis-server start #{node[:redis][:config_path]}"
  stop_command "/etc/init.d/redis-server stop"
  restart_command "/etc/init.d/redis-server restart"
  action :start
end

template "/etc/init.d/redis-server" do
  source "redis.init.erb"
  owner "root"
  group "root"
  mode 0755
  notifies :restart, resources(:service => "redis")
end

template "/etc/redis/redis.conf" do
  source "redis.conf.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, resources(:service => "redis")
end
