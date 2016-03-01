my_cnf_path = '/etc/mysql/my.cnf'

%w{mysql-server mysql-client}.each do |pkg|
  package pkg do
    action :install
  end
end

execute "set root password" do
  command "mysqladmin -u root password #{node['mysql']['server_root_password']}"
  only_if "mysql -u root -e 'show databases;'"
end

template "#{my_cnf_path}" do
  user 'root'
  group 'root'
  mode 644
  source 'etc/my.cnf.erb'

  variables ({
    :default_character_set => node['mysql']['default_character_set'],
    :collation_server => node['mysql']['collation_server'],
    :init_connect => node['mysql']['init_connect'],
  })
end

service "mysql" do
  action [ :start ]
end


