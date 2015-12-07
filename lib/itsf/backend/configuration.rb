require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'

module Itsf
  module Backend
    module Configuration
      def configure
        yield self
      end

      mattr_accessor :backend_engines
      mattr_accessor :resource_base_controller
      mattr_accessor :dashboard_base_controller
      mattr_accessor :home_base_controller
      mattr_accessor :engine_mount_point
      mattr_accessor :title_link
      mattr_accessor :resource_title_methods
      mattr_accessor :disabled_features

      # mattr_accessor :backend_engines do
      #   []
      # end

      # mattr_accessor :resource_base_controller do
      #   'ApplicationController'
      # end

      # mattr_accessor :dashboard_base_controller do
      #   'ApplicationController'
      # end

      # mattr_accessor :home_base_controller do
      #   'ApplicationController'
      # end

      # mattr_accessor :engine_mount_point do
      #   Proc.new { |router, engine|
      #     router.mount(
      #       engine => I18n.t(
      #         "routes.mount.#{engine.engine_name}",
      #         default: "/#{engine.name.deconstantize.underscore}"
      #       )
      #     )
      #   }
      # end

      # mattr_accessor :title_link do
      #   Proc.new { |view| view.link_to(view.t('.title'), '#', class: 'navbar-brand') }
      # end

      # mattr_accessor :resource_title_methods do
      #   [:human, :name, :email, :to_s] 
      # end
    end
  end
end