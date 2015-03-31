require 'serverspec'

set :background, :exec

describe package('python27') do
  it { should be_installed }
end

describe package('libffi-devel') do
  it { should be_installed }
end

describe file('/opt/pgd/settings.py') do
  it { should be_file }
  # This might require more testing but I'm not sure how to test it without
  # possibly giving away secrets.
end

describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end

describe file('/opt/pgd') do
  it { should be_directory }
end

describe file('/opt/vrt') do
  it { should be_directory }
end

describe file('/opt/pgd/selected_proteins.txt') do
  it { should be_file }
end
