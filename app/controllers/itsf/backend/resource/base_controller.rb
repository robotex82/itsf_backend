require 'ransack' if Itsf::Backend.features?(:ransack)
require 'kaminari' if Itsf::Backend.features?(:kaminari)

module Itsf::Backend
  class Resource::BaseController < Configuration.resource_base_controller.constantize
    if Itsf::Backend.features?(:pundit)
      include Controller::RestActionsConcernWithPundit
      include Pundit
      prepend Controller::PunditNamespacedAuthorizeConcern
      helper_method :engine_policy
    else
      include Controller::RestActionsConcern
    end
    include Controller::ResourceUrlsConcern
    include Controller::ResourceInflectionsConcern
    include Controller::RansackConcern if Itsf::Backend.features?(:ransack)
    include Controller::PaginationConcern if Itsf::Backend.features?(:kaminari)
    include Controller::JsonApiConcern
    helper Itsf::Backend::ApplicationHelper
    helper MultiClientHelper if Itsf::Backend.features?(:multi_client)
    
    helper_method :resource_class

    helper ResourceRenderer::ViewHelper

    layout 'itsf/backend/base'

    def self.resource_class
      name.gsub('Controller', '').singularize.constantize
    end

    def resource_class
      self.class.resource_class
    end
  end
end
