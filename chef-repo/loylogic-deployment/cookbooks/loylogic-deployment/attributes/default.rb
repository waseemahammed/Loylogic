
#Docker deployments
default['docker']['image']['tag'] = "latest"
default['docker']['image']['repo'] = "waseemahammed/loylogic"
default['docker']['container']['name'] = "spring-petclinic-service"
default['docker']['container']['host']['port'] = "80"
default['docker']['container']['container']['port'] = "8080"