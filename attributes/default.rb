default['pgd']['pgd_path'] = "/home/vagrant/pgd"
default['pgd']['virtualenv_path'] = "/home/vagrant/vrt"
default['pgd']['user'] = "vagrant"
default['pgd']['group'] = "vagrant"
default['pgd']['superuser'] = []

default['pgd']['application_name'] = "pgd"

#Django Settings.py
default['pgd']['debug'] = "True"
default['pgd']['static_root'] = ::File.join(default['pgd']['pgd_path'], 'static')
default['pgd']['static_url'] = "/static/"	#Trailing slash is must
# Settings.py database
default['pgd']['database']['engine'] = "django.db.backends.mysql"
default['pgd']['database']['name'] = "osuosl"
default['pgd']['database']['user'] = "root"
default['pgd']['database']['password'] = "1991"
default['pgd']['database']['host'] = "localhost"
default['pgd']['database']['port'] = nil

#Apache cofigurations
default['pgd']['apache']['server_name'] = node['hostname']
default['pgd']['apache']['server_aliases'] = [node['fqdn']]
default['pgd']['apache']['processes'] = 4
default['pgd']['apache']['threads'] = 1