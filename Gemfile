# gem 'puppet-blacksmith'
# gem 'pry'
# gem 'parallel_tests' # requires at least Ruby 1.9.3
# gem 'rubocop', :require => false # requires at least Ruby 1.9.2

source ENV['GEM_SOURCE'] || "https://rubygems.org"

group :development, :test do
  gem 'rake',                               :require => false
  gem 'coveralls',                          :require => false
  gem 'guard-rake',                         :require => false
  gem 'puppet-lint',                        :require => false
  gem 'puppet-lint-unquoted_string-check',  :require => false
  gem 'puppet-syntax',                      :require => false
  gem 'puppet_facts',                       :require => false
  gem 'puppetlabs_spec_helper',             :require => false
  gem 'json',                               :require => false
  gem 'metadata-json-lint',                 :require => false
  gem 'serverspec',                         :require => false
  gem 'rspec-core',                         :require => false
  gem 'rspec-puppet', '2.3.2',              :require => false
  gem 'rspec-puppet-facts',                 :require => false
  gem 'rspec-system',                       :require => false
  gem 'rspec-system-puppet',                :require => false
  gem 'rspec-system-serverspec',            :require => false
  gem 'simplecov',                          :require => false
  gem 'simplecov-console',                  :require => false
  gem 'travis',                             :require => false
  gem 'travis-lint',                        :require => false
  gem 'yard',                               :require => false
end

group :system_tests do
  gem "beaker", "~> 2.0",                   :require => false
  gem 'beaker-rspec',                       :require => false
  gem 'beaker-puppet_install_helper',       :require => false
end

if facterversion = ENV['FACTER_GEM_VERSION']
  gem 'facter', facterversion,              :require => false
else
  gem 'facter',                             :require => false
end

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion,              :require => false
else
  gem 'puppet',                             :require => false
end

# rspec must be v2 for ruby 1.8.7
if RUBY_VERSION >= '1.8.7' and RUBY_VERSION < '1.9'
  gem 'rspec', '~> 2.0'
end
