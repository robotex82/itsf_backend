module Itsf::Backend
  class DashboardController < Configuration.dashboard_base_controller.constantize
    layout 'itsf/backend/base'

    if Itsf::Backend.features?(:pundit)
      include Pundit
      prepend Controller::PunditNamespacedAuthorizeConcern
      helper_method :engine_policy

      after_action :verify_authorized

      def index
        authorize :dashboard, :access?, self.class.name.deconstantize
      end
    end
  end
end
