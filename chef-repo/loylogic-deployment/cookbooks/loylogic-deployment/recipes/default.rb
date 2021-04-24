#
# Cookbook:: loylogic-deployment
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

#docker_installation 'default'

#docker_service 'default' do
#    action [:create, :start]
#end

#Install Docker
bash 'Install Docker' do
    code <<-EOH
        sudo amazon-linux-extras install docker -y
        sudo service docker start
        sudo usermod -a -G docker jenkins
    EOH
end

#Make docker auto-start
bash 'Make docker auto-start' do
    code <<-EOH
        sudo chkconfig docker on
    EOH
end

include_recipe 'loylogic-deployment::deployment'