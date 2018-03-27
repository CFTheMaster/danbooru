set :user, "computerfreaker"
set :rails_env, "production"
server "localhost", :roles => %w(web app db), :primary => true, :user => "computerfreaker"
server "localhost", :roles => %w(web app), :user => "computerfreaker"

set :linked_files, fetch(:linked_files, []).push(".env.production")
set :rbenv_path, "/home/computerfreaker/.rbenv"