secrets = Chef::EncryptedDataBagItem.load('pgd', 'pgd_secrets')
db_host = secrets['db_host']
db_port = secrets['db_port']

server_user = secrets['db_user']
server_password = secrets['db_password']

db_user = secrets['db_user']
db_pass = secrets['db_password']

db_engine = secrets['db_engine']
db_name = secrets['db_name']

# Myql connect info
mysql_connection_info = {
    :host => db_host,
    :port => db_port,
    :username => 'root', #server_user || 'root',
    :password => node['mysql']['server_root_password']
}

# Postgres Connection info
postgresql_connection_info = {
  :host => db_host,
  :username => server_user || 'postgres',
  :password => server_password
}

case db_engine.split('.').last
when 'mysql'
  include_recipe "mysql::client"
  include_recipe "database::mysql"
  db_provider = Chef::Provider::Database::Mysql
  db_user_provider = Chef::Provider::Database::MysqlUser
  connection_info = mysql_connection_info
when 'psycopg2', 'postgresql_psycopg2'
  include_recipe "postgresql"
  include_recipe "database::postgres"
  db_provider = Chef::Provider::Database::Postgresql
  db_user_provider = Chef::Provider::Database::PostgresqlUser
  connection_info = postgresql_connection_info
end

# Creating database
log "Creating Database with name #{db_name}"
database db_name do
  provider db_provider
  connection connection_info
  action :create
end

# Create our user
database_user db_user do
  provider db_provider
  connection connection_info
  database_name db_name
  password db_pass
  action :create
end

# Give our user permissions to the DB
database_user db_user do
  provider db_user_provider
  connection connection_info
  database_name db_name
  privileges [:all]
  action :grant
end

# Give our user permissions to the test-DB
database_user db_user do
  provider db_user_provider
  connection connection_info
  database_name 'test_'+db_name
  privileges [:all]
  action :grant
end

python = ::File.join(node['pgd']['virtualenv_path'], 'bin', 'python')
pgd = node['pgd']['pgd_path']

# syncdb using django-admin.py
manage = ::File.join(node['pgd']['pgd_path'], 'manage.py')
log "Running syncdb for PGD"
execute "run_syncdb" do
  command "#{python} #{manage} syncdb --noinput"
  user node['pgd']['user']
  group node['pgd']['group']
end

dunbrack_selector = ::File.join(pgd, 'pgd_splicer', 'dunbrack_selector.py')
ftp_update = ::File.join(pgd, 'pgd_splicer', 'ftpupdate.py')
process_PDBTask = ::File.join(pgd, 'pgd_splicer', 'ProcessPDBTask.py')
selected_proteins = ::File.join(pgd, 'selected_proteins.txt')

log "Selecting Proteins"
execute "run_protein_select" do
  cwd pgd
  command <<-EOS
  ln -s pgd/settings.py settings.py
  #{python} #{dunbrack_selector} --pipeout > #{selected_proteins}
  head #{selected_proteins} | #{python} #{ftp_update} --pipein
  head #{selected_proteins} | #{python} #{process_PDBTask} --pipein
  EOS
  user node['pgd']['user']
  group node['pgd']['group']
end
