# Remove the Rails defaults.
Rake::Task['test:db'].clear
Rake::Task['test'].clear

namespace :test do
  desc 'Run all tests'
  task all: :environment do
    Rake::Task['bundle_audit'].invoke
    Rake::Task['brakeman:run'].invoke
    Rake::Task['spec'].invoke
  end
end

task :test do
  Rake::Task['test:all'].invoke
end

# Running `rake` should run all my tests.
task default: :test
