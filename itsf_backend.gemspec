$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "itsf/backend/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "itsf_backend"
  s.version     = Itsf::Backend::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/itsf_backend"
  s.summary     = "ITSF Backend Module."
  s.description = "Painless Rails Admin UI."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", ">= 4.0"
  s.add_dependency 'ace-rails-ap'
  s.add_dependency 'coffee-rails'
  s.add_dependency 'kaminari'
  s.add_dependency 'kaminari-i18n'
  s.add_dependency 'bootstrap-kaminari-views'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'jquery-ui-rails'
  s.add_dependency 'haml-rails'
  s.add_dependency 'pundit'
  s.add_dependency 'route_translator'
  s.add_dependency 'rails-i18n'
  s.add_dependency 'rails_rad'
  s.add_dependency 'ransack'
  s.add_dependency 'responders'
  s.add_dependency 'resource_renderer'
  s.add_dependency 'simple_display'
  s.add_dependency 'simple_form'
  s.add_dependency 'less-rails'
  s.add_dependency 'twitter-bootstrap-rails'

  s.add_development_dependency 'rails-dummy'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rails'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'shoulda-matchers', '~> 2.8.0'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'sqlite3'
end
