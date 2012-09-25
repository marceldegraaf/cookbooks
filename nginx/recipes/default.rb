package 'nginx'

%w{nxensite nxdissite}.each do |nxscript|
  template "/usr/sbin/#{nxscript}" do
    source "#{nxscript}.erb"
    mode "0755"
    owner "root"
    group "root"
    variables dir: node[:nginx][:dir]
  end
end

service 'nginx' do
  action :start
end
