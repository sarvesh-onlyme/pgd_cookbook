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
# These nil values will not work by default, either setup the databag or change
# these values
default['pgd']['database']['engine'] = "django.db.backends.mysql" 
default['pgd']['database']['name'] = "pgd-dev"
default['pgd']['database']['user'] = "pgd-user"
default['pgd']['database']['password'] = "pdg-pass"
default['pgd']['database']['host'] = nil #Don't forget to add a database
default['pgd']['database']['port'] = nil

#Apache cofigurations
default['pgd']['apache']['server_name'] = node['hostname']
default['pgd']['apache']['server_aliases'] = [node['fqdn']]
default['pgd']['apache']['processes'] = 4
default['pgd']['apache']['threads'] = 1

#PGD git
default['pgd']['git']['repository'] = "https://github.com/osuosl/pgd.git"
default['pgd']['git']['revision'] = "develop"

override['build-essential']['compile_time'] = true

# Bootstrap User
default['pgd']['username'] = "Your_Name" #Only letters, digits, and underscore
default['pgd']['email'] = "your_email@example.com"
default['pgd']['password'] = "secret_password"

default['mysql']['server_debian_password'] = "password"
default['mysql']['server_root_password'] = "password"
default['mysql']['server_repl_password'] = "password"
