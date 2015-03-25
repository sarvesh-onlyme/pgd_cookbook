include_recipe 'apache2::default'
include_recipe 'apache2::mod_wsgi'

python_version = node['languages']['python']['version']
version = python_version.split('.')
version = version[0] + '.' + version[1]
python_version = 'python#{version}'

python_path = ::File.join(node['pgd']['virtualenv_path'], 'lib',
                          python_version, 'site-packages')
wsgi_path = ::File.join(node['pgd']['pgd_path'], 'pgd', 'wsgi.py')

web_app node['pgd']['application_name'] do
  template 'pgd_apache_vhost.conf.erb'
  server_name node['hostname']
  server_aliases node['pgd']['apache']['server_aliases']
  cookbook 'pgd_cookbook'
  server_name node['pgd']['apache']['server_name']
  app node['pgd']
  processes node['pgd']['apache']['processes']
  threads node['pgd']['apache']['threads']
  wsgi_process_group 'pgd'
  wsgi_path wsgi_path
  python_path python_path
end

service 'apache2' do
  action [:enable, :start]
end
