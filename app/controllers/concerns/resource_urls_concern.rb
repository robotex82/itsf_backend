module ResourceUrlsConcern
  extend ActiveSupport::Concern

  included do
    helper_method :collection_path,
                  :edit_resource_path,
                  :new_resource_path,
                  :resource_path
  end

  def collection_path
    url_for(controller: controller_path, action: :index)
  end

  def new_resource_path
    url_for(controller: controller_path, action: :new)
  end

  def edit_resource_path(resource)
    url_for(controller: controller_path, action: :edit, id: resource.to_param)
  end

  def resource_path(resource)
    url_for(controller: controller_path, action: :show, id: resource.to_param)
  end
end
