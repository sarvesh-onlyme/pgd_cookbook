venv = node['pgd']['virtualenv_path']
venv_bin = ::File.join(venv, 'bin')
python = ::File.join(venv_bin, 'python')
# django_admin = ::File.join(venv_bin, 'django-admin.py')
manage = ::File.join(node['pgd']['pgd_path'], 'manage.py')

env = {
  'PGD_CONFIG_DIR' => node['pgd']['virtualenv_path'].to_s,
  'DJANGO_SETTINGS_MODULE' => 'pgd.settings',
  'PYTHONPATH' => '/home/vagrant;/home/vagrant/pgd'
}

# Use the attributes to bootstrap users if set, otherwise use databag users
# user = node['pgd']['superuser']

username = node['pgd']['username']
email = node['pgd']['email']
password = node['pgd']['password']

log 'Creating django superuser #{username}'

execute 'create_superuser' do
  ignore_failure true
  command <<-EOS
  #{python} #{manage} createsuperuser --noinput --username=#{username} --email\
=#{email}
  echo #{python} #{manage} createsuperuser --noinput --username=#{username} --\
email=#{email}
  echo $PYTHONPATH $DJANGO_SETTINGS_MODULE $PGD_CONFIG_DIR
  echo 'from django.contrib.auth.models import User;u=User.objects.get(usernam\
e='#{username}');u.set_password('#{password}');u.save();' | #{python} #{manage\
} shell
  EOS
  user node['pgd']['user']
  group node['pgd']['group']
  environment env
  cwd '/home/vagrant'
end
