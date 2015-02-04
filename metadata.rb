name             'pgd_cookbook'
maintainer       'Oregon State University'
maintainer_email 'systems@osuosl.org'
license          'All rights reserved'
description      'Installs/Configures pgd_cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends          'apache2'
depends          'build-essential'
depends          'database'
depends          'git'
depends          'mysql'
depends          'postgresql'
depends          'python'
depends          'yum'
depends          'yum-epel'
depends          'yum-ius'
depends          'yum-osuosl'
