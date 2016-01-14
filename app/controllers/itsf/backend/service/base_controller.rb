require 'ransack' if Itsf::Backend.features?(:ransack)
require 'kaminari' if Itsf::Backend.features?(:kaminari)

module Itsf::Backend
  class Service::BaseController < Configuration.service_base_controller.constantize
    if Itsf::Backend.features?(:pundit)
      include Pundit
      include Controller::PunditNamespacedAuthorizeConcern 
    end

    include Controller::ServiceInflectionsConcern
    include Controller::ServiceUrlsConcern
    include Controller::ServiceActionsConcern

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
