require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:smoke) do |t|
    t.cucumber_opts = "--format pretty --tag @smoke -p start" # Any valid command line option can go here.
end
