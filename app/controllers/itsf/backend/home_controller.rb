module Itsf::Backend
  class HomeController < Configuration.home_base_controller.constantize
    helper Itsf::Backend::ApplicationHelper
    helper Itsf::Backend::BootstrapHelper
    helper MultiClientHelper if Itsf::Backend.features?(:multi_client)

    def index
    end

    if Itsf::Backend.features?(:pundit)
      include Pundit
      prepend Controller::PunditNamespacedAuthorizeConcern
      include Controller::PunditAuthorizationFailureHandlingConcern
      helper_method :engine_policy

      after_action :verify_authorized

      def index
        authorize :engine, :access?, self.class.name.deconstantize
      end
    end

    layout 'itsf/backend/base'

    helper_method :engine

    def self.engine
      "#{name.deconstantize}::Engine".constantize
    end

    def engine
      self.class.engine
    end
  end
end
