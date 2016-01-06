module Itsf::Backend
  class HomeController < Configuration.home_base_controller.constantize
    include Pundit
    prepend Controller::PunditNamespacedAuthorizeConcern
    helper_method :engine_policy
    
    layout 'itsf/backend/base'

    helper_method :engine

    def self.engine
      "#{name.deconstantize}::Engine".constantize
    end

    def engine
      self.class.engine
    end

    def index
    end
  end
end
