module Controller
  module ActsAsListConcern
    extend ActiveSupport::Concern

    def reposition
      @resource = load_resource
      @dropped_resource = load_scope.find(params[:dropped_id])
      @dropped_resource.set_list_position(@resource.position)
      position = @dropped_resource.position < @resource.position ? :before : :after
      redirect_to collection_path, notice: I18n.t("acts_as_list.inserted_#{position}", target_resource: @resource.try_all(*Itsf::Backend::Configuration.resource_title_methods), inserted_resource: @dropped_resource.try_all(*Itsf::Backend::Configuration.resource_title_methods))
    end
  end
end
