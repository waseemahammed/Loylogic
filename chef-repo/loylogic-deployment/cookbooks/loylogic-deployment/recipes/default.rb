#
# Cookbook:: loylogic-deployment
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

docker_installation 'default'

docker_service 'default' do
    action [:create, :start]
end  

include_recipe 'loylogic-deployment::deployment'