require 'active_support/core_ext/module/delegation'
require 'active_support/core_ext/module/attribute_accessors'

module Itsf
  module Backend
    module Configuration
      def configure
        yield self
      end

      mattr_accessor :backend_engines do
        []
      end

      mattr_accessor :base_controller do
        'ApplicationController'
      end

      mattr_accessor :title_link do
        Proc.new { |view| view.link_to(view.t('.title'), '#', class: 'navbar-brand') }
      end
    end
  end
end