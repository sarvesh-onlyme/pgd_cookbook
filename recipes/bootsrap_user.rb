venv = node['pgd']['virtualenv_path']
venv_bin = ::File.join(venv, 'bin')
python = ::File.join(venv_bin, 'python')
#django_admin = ::File.join(venv_bin, 'django-admin.py')
manage = ::File.join(node['pgd']['pgd_path'], 'manage.py')

env = {
  "PGD_CONFIG_DIR" => node['pgd']['virtualenv_path'].to_s ,
  "DJANGO_SETTINGS_MODULE" => "pgd.settings"
}

# Use the attributes to bootstrap users if set, otherwise use databag users
user = node['pgd']['superuser']

username = user['username']
email = user['email']
password = user['password']

log "Creating django superuser #{username}"

execute "create_superuser" do
  command <<-EOS
  #{python} #{manage} createsuperuser --noinput --username=#{username} --email #{email}
  #{python} -c \"from django.contrib.auth.models import User;u=User.objects.get(username='#{username}');u.set_password('#{password}');u.save();\"
  EOS
  user node['pgd']['user']
  group node['pgd']['group']
  environment env
end
