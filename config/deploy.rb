set :application, 'HQ'
set :user, 'hqadmin'
set :domain, '97.74.197.29'
set :mongrel_port, '8000'
set :server_hostname, 'hqchannel.com'

set :git_account, 'openwave'

set :scm_passphrase,  Proc.new { Capistrano::CLI.password_prompt('Git Password:1220broadway ') }

role :web, "97.74.197.29"
role :app, "97.74.197.29"
role :db, "97.74.197.29", :primary => true

default_run_options[:pty] = true
set :user, "hqadmin"
set :repository,  "git://github.com/openwave/HQ.git"
set :scm, "git"

ssh_options[:forward_agent] = true
set :branch, "master"
#set :deploy_via, :remote_cache
#set :git_shallow_clone, 1
set :git_enable_submodules, 1
set :use_sudo, true
set :deploy_to, "/home/hqadmin/HQ"
set :migrate_env, ""
set :rails_env, "production"
set :rake,           "rake"
set :password, "Quarter14"
set :migrate_target, :latest

namespace :deploy do
   task :change_password do
     run "cd #{current_release}; chmod 755 app config db lib public vendor script script/*"
     run "sed -i 's:{PASSWORD}:admin@my12:g' #{current_release}/config/database.yml"
     run "sed -i 's:admin:hqpass@my12:g' #{current_release}/config/database.yml"
   end
   task :restart do
     run "cd #{current_path}; sudo mongrel_rails cluster::configure -e production -p 8000 -N 3 -c #{current_path}/ -l #{current_path}/log/mongrel.log  -P /tmp/pids/mongrel.pid -e production"
    run "sudo rm -f /etc/mongrel_cluster/HQ.yml"
     run "sudo ln -fs #{current_path}/config/mongrel_cluster.yml /etc/mongrel_cluster/HQ.yml"
#     set :mongrel_conf, "#{deploy_to}/current/config/mongrel_cluster.yml"
     run "sudo /etc/init.d/mongrel_cluster stop"
     run "sudo /etc/init.d/mongrel_cluster start"
   end

   task :service do

   end


end

after 'deploy:update_code', 'deploy:change_password'
after 'deploy:change_password', 'deploy:migrate'
