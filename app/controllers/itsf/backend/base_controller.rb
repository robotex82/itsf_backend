require 'ransack' if Itsf::Backend.features?(:ransack)
require 'kaminari' if Itsf::Backend.features?(:kaminari)

module Itsf::Backend
  class BaseController < Configuration.resource_base_controller.constantize
    if Itsf::Backend.features?(:pundit)
      include RestActionsConcernWithPundit
    else
      include RestActionsConcern
    end
    include ResourceUrlsConcern
    include ResourceInflectionsConcern
    include Controller::PaginationConcern if Itsf::Backend.features?(:kaminari)

    include Pundit
    prepend Controller::PunditNamespacedAuthorizeConcern
    helper_method :engine_policy

    helper_method :resource_class

    helper ResourceRenderer::ViewHelper
    
    def self.resource_class
      name.gsub('Controller', '').constantize
    end
    
    def resource_class
      self.class.resource_class
    end
  end
end
