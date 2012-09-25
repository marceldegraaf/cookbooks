package "munin"

directory "/var/www/munin" do
  owner "www-data"
  group "root"
  mode 0777
  recursive true
end

template "/etc/munin/munin.conf" do
  source "munin.conf.erb"
  mode 0644
  variables :name => node[:application]
  notifies :restart, "service[munin-node]"
end

template "/etc/munin/munin-node.conf" do
  source "munin-node.conf.erb"
  mode 0644
  notifies :restart, "service[munin-node]"
end

#
# TODO this should use the nginx_site definition instead of
# creating a template ourselves.
#
template "#{node[:nginx][:dir]}/sites-available/munin.conf" do
  source "nginx-munin.conf.erb"
  owner "root"
  group "root"
  mode  0755
  variables :server_name => node[:munin][:server_name],
            :html_dir => node[:munin][:html_dir]
end

nginx_site 'munin.conf' do
  enable true
end

service "munin-node"
