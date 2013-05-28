$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'json-generator'

Gem::Specification.new do |gem|
  gem.name = 'json-generator'
  gem.version = JSON::Generator::VERSION.dup
  gem.summary = 'Generates a valid JSON document for a given JSON Schema'
  gem.description = 'Generates a valid JSON document for a given JSON Schema'
  gem.homepage = 'https://github.com/tmattia/json-generator'

  gem.authors = ['ThoughtWorks & Abril']
  gem.email = ['abril_vejasp_dev@thoughtworkgem.com']
  gem.license = 'MIT'

  gem.files = Dir.glob('lib/**/*.rb')
  gem.test_files = Dir.glob('spec/**/*.rb')

  gem.require_paths = ['lib']

  gem.add_dependency 'json-schema'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rspec'
end
