fpm_conf_path = '/etc/php5/fpm/php-fpm.conf';
www_conf_path = '/etc/php5/fpm/pool.d/www.conf'
php_ini_cli_path = '/etc/php5/cli/php.ini'
php_ini_fpm_path = '/etc/php5/fpm/php.ini'

%w{php5-common php5 php5-cgi php5-cli php5-mysql php5-gd php-apc php5-fpm php5-curl php5-json php5-dev}.each do |pkg|
  package pkg do
    action :install
  end
end

template "#{fpm_conf_path}" do
  user 'root'
  group 'root'
  mode 644
  source 'etc/php5/fpm/php-fpm.conf.erb'
=begin
  variables ({
  })
=end
end

template "#{www_conf_path}" do
  user 'root'
  group 'root'
  mode 644
  source 'etc/php5/fpm/pool.d/www.conf.erb'
=begin
  variables ({
  })
=end
end

template "#{php_ini_cli_path}" do
  user 'root'
  group 'root'
  mode 644
  source 'etc/php5/cli/php.ini.erb'
=begin
  variables ({
  })
=end
end

template "#{php_ini_fpm_path}" do
  user 'root'
  group 'root'
  mode 644
  source 'etc/php5/fpm/php.ini.erb'
=begin
  variables ({
  })
=end
end

service "php5-fpm" do
  action [ :start ]
end
