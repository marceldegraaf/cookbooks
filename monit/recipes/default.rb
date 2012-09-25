package "monit"

directory "/etc/monit/conf.d" do
  action :create
  recursive true
end

template "/etc/monit/monitrc" do
  source "monitrc.erb"
  mode   "0600"
  variables :alert_emails => node[:monit][:alert_emails],
            :logfile      => node[:monit][:logfile]
  notifies :restart, "service[monit]"
end

service "monit" do
  action :nothing
end
