namespace :db do

  desc "This loads the bootstrap database"
  task :seed => :environment do
    require 'active_record/fixtures'
    puts "looking at files in " + Rails.root.to_s+'/db/fixtures/*.yml'

    Dir.glob(Rails.root.to_s+'/db/fixtures/*.yml').each do |file|
      base_name = File.basename(file,'.*')
      puts "Loading #{base_name}"
      ActiveRecord::Fixtures.create_fixtures('db/fixtures', base_name)
    end
  end

  desc "This rebuilds the entire db"
  task :reseed => [:environment, 'db:reset', 'db:seed']
  
end