require 'serverspec'

set :background, :exec

describe package("python27") do
  it { should be_installed }
end

describe user("vagrant") do
  it { should exist }
end

describe group("vagrant") do
  it { should exist }
end

describe package("libffi-devel") do
  it { should be_installed }
end

describe file("/home/vagrant/pgd/settings.py") do
  it { should be_file }
# This might require more testing but I"m not sure how to test it without
# possibly giving away secrets.
end

describe service("httpd") do
    it { should be_enabled }
    it { should be_running }
end

describe file("/home/vagrant/pgd") do
    it { should be_directory }
end

describe file("/home/vagrant/vrt") do
    it { should be_directory }
end

describe file("/home/vagrant/pgd/selected_proteins.txt") do
    it { should be_file }
end
