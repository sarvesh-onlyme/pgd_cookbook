include_recipe 'yum-ius'
include_recipe 'yum-epel'
include_recipe 'yum-osuosl'

%w{python27 python27-devel}.each do |pkg|
  package pkg
end
