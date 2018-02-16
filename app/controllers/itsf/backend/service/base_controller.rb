require 'ransack' if Itsf::Backend.features?(:ransack)
require 'kaminari' if Itsf::Backend.features?(:kaminari)

module Itsf::Backend
  class Service::BaseController < Configuration.service_base_controller.constantize
    if Itsf::Backend.features?(:pundit)
      include Pundit
      include Controller::PunditNamespacedAuthorizeConcern 
      include Controller::PunditAuthorizationFailureHandlingConcern
    end

    include ServiceController::Service
    include ServiceController::ServiceInflections
    include ServiceController::RestServiceUrls
    include ServiceController::RestActions
    include ServiceController::LocationHistory
    # include Controller::JsonApiConcern
    include Controller::FeatureFlagsConcern
    include Controller::CurrentEngineConcern
    include Controller::BreadcrumbsConcern
    
    helper Itsf::Backend::ApplicationHelper
    helper Itsf::Backend::BootstrapHelper

    layout 'itsf/backend/base'
  end
end
