module Itsf::Backend
  class DashboardController < Configuration.dashboard_base_controller.constantize
    helper Itsf::Backend::ApplicationHelper
    helper MultiClientHelper if Itsf::Backend.features?(:multi_client)
    
    layout 'itsf/backend/base'

    if Itsf::Backend.features?(:pundit)
      include Pundit
      prepend Controller::PunditNamespacedAuthorizeConcern
      include Controller::PunditAuthorizationFailureHandlingConcern
      helper_method :engine_policy

      after_action :verify_authorized

      def index
        authorize :dashboard, :access?, self.class.name.deconstantize
      end
    end
  end
end
