venv = node['pgd']['virtualenv_path']
venv_bin = ::File.join(venv, 'bin')
python = ::File.join(venv_bin, 'python')
django_admin = ::File.join(venv_bin, 'django-admin.py')

#env = {
#  "GWM_CONFIG_DIR" => node['ganeti_webmgr']['config_dir'].to_s ,
#  "DJANGO_SETTINGS_MODULE" => "ganeti_webmgr.ganeti_web.settings"
#}

# Use the attributes to bootstrap users if set, otherwise use databag users
users = node['pgd']['superuser']

users.each do |user|
  username = user['username']
  email = user['email']
  password = user['password']

  log "Creating django superuser #{username}"

  execute "create_superuser" do
    command <<-EOS
    #{django_admin} createsuperuser --noinput --username=#{username} --email #{email}
    #{python} -c \"from django.contrib.auth.models import User;u=User.objects.get(username='#{username}');u.set_password('#{password}');u.save();\"
    EOS
    user node['pgd']['user']
    group node['pgd']['group']
    environment env
  end
end