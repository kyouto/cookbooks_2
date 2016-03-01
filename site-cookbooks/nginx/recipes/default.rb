site_conf_path = "/etc/nginx/sites-available/#{node['nginx']['site_domain']}.conf"

package "nginx" do
  action :install
end

service "nginx" do
  supports status: true, restart: true, reload: true
  action [:enable, :start]
end

template "#{site_conf_path}" do
  owner "root"
  group "root"
  mode 0644
  source "etc/sites-available/#{node['nginx']['site_domain']}.conf.erb"

  variables ({
    :site_domain => node['nginx']['site_domain'],
    :root => node['nginx']['root'],
  })


  # この動作のあとでnginxを再起動
  #notifies :reload, "service[nginx]"

end

execute "make symbolic_link" do
  command "ln -s /etc/nginx/sites-available/#{node['nginx']['site_domain']}.conf /etc/nginx/sites-enabled/"
  not_if { File.exists?("/etc/nginx/sites-enabled/#{node['nginx']['site_domain']}.conf") }
end

service "mysql" do
  action [ :reload ]
end
