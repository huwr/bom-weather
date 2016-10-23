begin
  require 'rubygems'
  require 'spec'
end

require 'rspec/core/rake_task'
# begin
#   require 'spec/rake/spectask'
# rescue LoadError
#   puts <<-EOS
# To use rspec for testing you must install rspec gem:
#     gem install rspec
# EOS
#   exit(0)
# end

desc "Run the specs under spec"
RSpec::Core::RakeTask.new('spec') do |t|
  t.rspec_opts = ['--options', "spec/spec.opts"]
  t.pattern = 'spec/**/*_spec.rb'
end

desc "Run the specs under spec with code coverage"
RSpec::Core::RakeTask.new('rcov') do |t|
  t.rspec_opts = ['--options', "spec/spec.opts"]
  t.pattern = 'spec/**/*_spec.rb'
  t.rcov = true
  t.rcov_opts = ['--exclude', 'spec']
end

desc "Generate spec HTML report"
RSpec::Core::RakeTask.new('spec-report') do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.rspec_opts = ["--format", "html:doc/rspec-results.html", "--diff"]
  t.fail_on_error = false
end
