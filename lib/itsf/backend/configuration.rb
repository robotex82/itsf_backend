require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'

module Itsf
  module Backend
    module Configuration
      def configure
        yield self
      end

      mattr_accessor(:backend_engines) { -> { [] } }
      mattr_accessor(:resource_base_controller) { '::ApplicationController' }
      mattr_accessor(:dashboard_base_controller) { '::ApplicationController' }
      mattr_accessor(:home_base_controller) { '::ApplicationController' }
      mattr_accessor :engine_mount_point
      mattr_accessor :title_link
      mattr_accessor :resource_title_methods
      mattr_accessor(:disabled_features) { [] }
      mattr_accessor(:hidden_attributes_for) do
        { index: [], show: [], edit: [] }
      end
      mattr_accessor(:default_pagination_size) { 15 }

      def registered_controllers
        backend_engines.call.collect do |engine|
          "#{engine.parent}::Configuration".constantize.registered_controllers.call
        end.flatten
      end

      def registered_resources
        registered_controllers.call.collect do |controller|
          controller.resource_class if controller.respond_to?(:resource_class)
        end.compact
      end
    end
  end
end
