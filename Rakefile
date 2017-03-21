require 'rake/testtask'
require 'rake/notes/rake_task'

Rake::TestTask.new do |t|
  t.test_files = FileList['test/*_test.rb']
end

namespace :slcsp do
  require './runner'

  desc "Run slcsp and print to console"
  task :console do
    Runner.new('console').process
  end

  desc "Run slcsp and update csv"
  task :csv do
    Runner.new('csv').process
  end
end

task default: :test
