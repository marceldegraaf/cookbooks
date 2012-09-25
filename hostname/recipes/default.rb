template "/etc/rc.local" do
  source "rc.local.erb"
  mode "0766"
end

execute "set-hostname" do
  command "/root/set-hostname.sh"
  action :nothing
end

template "/root/set-hostname.sh" do
  source "set-hostname.sh.erb"
  mode "0700"
  variables hostname: node[:hostname]
  notifies :run, resources(execute: "set-hostname")
end
