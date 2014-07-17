#
# Cookbook Name:: pgd_cookbook
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "ubuntu"
include_recipe "apt"
include_recipe "python"
include_recipe "mysql::client"
include_recipe "mysql::server"
include_recipe "pgd_cookbook::apache"

service 'apache2' do
  action [ :enable, :start ]
end

python_virtualenv node['pgd']['virtualenv_path'] do
  interpreter "python2.7"
  owner node['pgd']['user']
  group node['pgd']['group']
  action :create
end

# cairoffi dependency
apt_package "libffi-dev" do
  action :install
end

python_pip "#{node['pgd']['pgd_path']}/requirements.txt" do
  options "-r"
  virtualenv node['pgd']['virtualenv_path']
  action :install
end

config_file = "#{node['pgd']['pgd_path']}/pgd/settings.py" #::File.join(node['ganeti_webmgr']['config_dir'], 'config.yml')
template config_file do
  source "django_settings.py.erb"
  owner "vagrant"
  group "vagrant"
  mode "0644"
  variables({
  	:app => node['pgd']
  })
end

print "PGD Done"