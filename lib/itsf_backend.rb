require 'ace-rails-ap'
require 'admino'
require 'kaminari'
require 'bootstrap-kaminari-views'
require 'haml-rails'
require 'less-rails'
require 'ransack' if Gem::Specification.find_all_by_name('ransack').any?
require 'responders'
require 'simple_form'
require 'twitter-bootstrap-rails'

require "itsf/backend"
require "itsf/backend/engine"