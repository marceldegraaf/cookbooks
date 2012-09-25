# Install Java, Tomcat and Solr
%w(openjdk-6-jre-headless solr-tomcat).each do |app|
  package app do
    action :install
  end
end

# Copy the Solr config files from the cookbook's files directory
%w(schema.xml solrconfig.xml).each do |config_file|
  cookbook_file "/etc/solr/conf/#{config_file}" do
    source config_file
    mode "0644"
    notifies :restart, "service[tomcat6]"
  end
end

# Make sure the tomcat6 user can write to /var/lib/tomcat6
directory "/var/lib/tomcat6" do
  owner 'tomcat6'
  group 'tomcat6'
  mode  '0744'
end

service "tomcat6"
