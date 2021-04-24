#
# Cookbook:: loylogic-deployment
# Recipe:: deployment
#
# Copyright:: 2021, The Authors, All Rights Reserved.

docker_image "#{node['docker']['image']['repo']}" do
    action :pull
    tag "#{node['docker']['image']['tag']}"
end
  
docker_container "#{node['docker']['container']['name']}" do
    repo "#{node['docker']['image']['repo']}"
    port "#{node['docker']['container']['host']['port']}:#{node['docker']['container']['container']['port']}"
end