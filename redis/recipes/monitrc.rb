template "/etc/monit/conf.d/redis.monitrc" do
  source "redis.monitrc.erb"
  mode   "0744"
  user   "root"
  variables :rules => node[:redis][:monit][:rules]
  notifies :reload, "service[monit]"
end
