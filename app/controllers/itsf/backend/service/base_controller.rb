require 'ransack' if Itsf::Backend.features?(:ransack)
require 'kaminari' if Itsf::Backend.features?(:kaminari)

module Itsf::Backend
  class Service::BaseController < Configuration.service_base_controller.constantize
    if Itsf::Backend.features?(:pundit)
      include Pundit
      include Controller::PunditNamespacedAuthorizeConcern 
      include Controller::PunditAuthorizationFailureHandlingConcern
    end

    include Controller::ServiceInflectionsConcern
    include Controller::ServiceUrlsConcern
    include Controller::ServiceActionsConcern
    include Controller::JsonApiConcern
    include Controller::FeatureFlagsConcern
    include Controller::CurrentEngineConcern
    include Controller::BreadcrumbsConcern
    
    helper Itsf::Backend::ApplicationHelper
    helper Itsf::Backend::BootstrapHelper

    layout 'itsf/backend/base'

    helper_method :service_class

    def self.service_class
      name.gsub('Controller', '').constantize
    end

    def service_class
      self.class.service_class
    end
  end
end
