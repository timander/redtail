namespace :db do 
  desc "Nuke and pave"
  task :nuke => ["db:reset", "db:fixtures:load"] do 
    puts "Database is nuked and paved."
  end
end