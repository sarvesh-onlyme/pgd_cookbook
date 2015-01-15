require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe process("python2.7") do
  its(:args) { should match /foo/ }
  it { should be_running }
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

describe process("httpd") do
    it { should_be_running }
end

describe file("/home/vagrant/pgd") do
    it { should be_directory }
end

describe file("/home/vagrant/vrt") do
    it { should be_directory }
end

descrbe file("/home/vagrant/pgd/selected_protiens.txt") do
    it { should exist }
end
