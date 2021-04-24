name 'chef-repo'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures chef-repo'
long_description 'Installs/Configures chef-repo'
version '0.1.0'
chef_version '>= 12.14' if respond_to?(:chef_version)

depends 'docker'