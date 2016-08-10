require 'rake'
require 'rspec/core/rake_task'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'

desc "Run all RSpec code examples"
RSpec::Core::RakeTask.new(:rspec) do |t|
  File.exist?('spec/spec.opts') ? opts = File.read("spec/spec.opts").chomp : opts = ""
  t.rspec_opts = opts
end

SPEC_SUITES = (Dir.entries('spec') - ['.', '..','fixtures']).select {|e| File.directory? "spec/#{e}" }
namespace :rspec do
  SPEC_SUITES.each do |suite|
    desc "Run #{suite} RSpec code examples"
    RSpec::Core::RakeTask.new(suite) do |t|
      t.pattern = "spec/#{suite}/**/*_spec.rb"
      File.exist?('spec/spec.opts') ? opts = File.read("spec/spec.opts").chomp : opts = ""
      t.rspec_opts = opts
    end
  end
end
task :default => :rspec

begin
  if Gem::Specification::find_by_name('puppet-lint')
    require 'puppet-lint/tasks/puppet-lint'
    PuppetLint.configuration.send('disable_autoloader_layout')
    PuppetLint.configuration.send('disable_80chars')
    PuppetLint.configuration.fail_on_warnings
    # PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "vendor/**/*.pp"]
    exclude_paths = [
      "pkg/**/*",
      "vendor/**/*",
      "spec/**/*",
    ]
    PuppetLint.configuration.ignore_paths = exclude_paths
    PuppetSyntax.exclude_paths = exclude_paths
    PuppetLint.configuration.log_format = "%{path}:%{linenumber}:%{check}:%{KIND}:%{message}"
    task :default => [:rspec, :lint]
  end
rescue Gem::LoadError
end

task :default => [:lint, :spec]


# begin
#   if Gem::Specification::find_by_name('puppet-lint')
#     PuppetLint.configuration.relative = true
#     PuppetLint.configuration.fail_on_warnings = true
#     task :default => [:rspec, :lint]
#   end
# rescue Gem::LoadError
# end

# begin
#   require 'parallel_tests/cli'
#   desc 'Run spec tests in parallel'
#   task :parallel_spec do
#     Rake::Task[:spec_prep].invoke
#     ParallelTests::CLI.new.run('-o "--format=progress" -t rspec spec/classes spec/defines'.split)
#     Rake::Task[:spec_clean].invoke
#   end
#   desc 'Run syntax, lint, spec and metadata tests in parallel'
#   task :parallel_test => [
#     :syntax,
#     :lint,
#     :parallel_spec,
#     :metadata,
#   ]
# rescue LoadError # rubocop:disable Lint/HandleExceptions
# end

# This fixes a backwards incompatibility in puppetlabs_spec_helper 1.1.0
# if Rake::Task.task_defined?('metadata_lint')
#   task :metadata => :metadata_lint
# end
#
# desc 'Run syntax, lint, spec and metadata tests'
# task :test => [
#   :syntax,
#   :lint,
#   :spec,
#   :metadata,
# ]
