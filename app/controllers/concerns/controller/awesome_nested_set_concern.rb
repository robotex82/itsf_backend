module Controller
  module AwesomeNestedSetConcern
    extend ActiveSupport::Concern

    def reposition
      @resource = load_resource
      @dropped_resource = resource_class.find(params[:dropped_id])
      @dropped_resource.move_to_right_of(@resource)
      redirect_to collection_path, notice: I18n.t("awesome_nested_set.inserted_after", target_resource: @resource.try_all(*Itsf::Backend::Configuration.resource_title_methods), inserted_resource: @dropped_resource.try_all(*Itsf::Backend::Configuration.resource_title_methods))
    end
  end
end
