current_dir = File.dirname(__FILE__)
log_level :info
log_location "#{current_dir}/chef-solo.log"
#cookbook_path ["#{current_dir}/cookbooks/"]
cookbook_path ["C:\\Users\\wahammed\\Documents\\OldPC-D Drive\\GCE\\SCM\\Poc\\Loylogic\\chef-repo\\loylogic-deployment\\cookbooks"]
file_cache_path ["#{current_dir}/.chef/cache"]
environment_path ["#{current_dir}/environments"]