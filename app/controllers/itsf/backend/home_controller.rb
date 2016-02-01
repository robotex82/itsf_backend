module Itsf::Backend
  class HomeController < Configuration.home_base_controller.constantize
    helper Itsf::Backend::ApplicationHelper
    helper MultiClientHelper if Itsf::Backend.features?(:multi_client)

    if Itsf::Backend.features?(:pundit)
      include Pundit
      prepend Controller::PunditNamespacedAuthorizeConcern
      helper_method :engine_policy
    end

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
