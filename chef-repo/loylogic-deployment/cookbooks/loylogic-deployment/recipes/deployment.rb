#
# Cookbook:: loylogic-deployment
# Recipe:: deployment
#
# Copyright:: 2021, The Authors, All Rights Reserved.

docker_image 'waseemahammed/loylogic' do
    action :pull
end
  
docker_container 'waseemahammed/loylogic' do
    repo 'waseemahammed/loylogic'
    port '80:8080'
end