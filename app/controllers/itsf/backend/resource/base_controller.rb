require 'ransack' if Itsf::Backend.features?(:ransack)
require 'kaminari' if Itsf::Backend.features?(:kaminari)

module Itsf::Backend
  class Resource::BaseController < Configuration.resource_base_controller.constantize
    if Itsf::Backend.features?(:pundit)
      include Controller::RestActionsConcernWithPundit
      include Pundit
      prepend Controller::PunditNamespacedAuthorizeConcern
      include Controller::PunditAuthorizationFailureHandlingConcern
      helper_method :engine_policy
    else
      include Controller::RestActionsConcern
    end
    include Controller::ResourceUrlsConcern
    include Controller::ResourceInflectionsConcern
    prepend Controller::RansackConcern if Itsf::Backend.features?(:ransack)
    prepend Controller::PaginationConcern if Itsf::Backend.features?(:kaminari)
    include Controller::JsonApiConcern
    include Controller::FeatureFlagsConcern
    include Controller::ResourceLinksConcern
    include Controller::CollectionLinksConcern
    include Controller::CurrentEngineConcern
    include Controller::BreadcrumbsConcern
    helper Itsf::Backend::ApplicationHelper
    helper Itsf::Backend::BootstrapHelper
    helper MultiClientHelper if Itsf::Backend.features?(:multi_client)
    
    helper_method :resource_class

    helper ResourceRenderer::ViewHelper

    layout 'itsf/backend/base'

    def self.resource_class
      name.gsub('Controller', '').singularize.constantize
    end

      def self.resource_count
        resource_class.count
      end

    def resource_class
      self.class.resource_class
    end

    private

    def after_create_location
      return edit_resource_path(@resource) if params.has_key?(:commit_and_continue_with_edit) && @resource.persisted?
      return new_resource_path if params.has_key?(:commit_and_continue_with_new) && @resource.persisted?
      @resource
    end

    def after_update_location
      return edit_resource_path(@resource) if params.has_key?(:commit_and_continue_with_edit) && !@resource.changed?
      return new_resource_path if params.has_key?(:commit_and_continue_with_new) && !@resource.changed?
      @resource
    end
  end
end
