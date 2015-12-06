module RestActionsConcern
  extend ActiveSupport::Concern

  included do
    respond_to :html
    responders :flash
  end

  def index
    @q = collection_scope_with_search_scopes.ransack(params[:q])
    @collection = @q.result.page(params[:page]).per(10)

    respond_with @collection
  end

  def new
    @resource = resource_class.new
    respond_with @resource
  end

  def create
    @resource = resource_class.new(permitted_params)
    @resource.save
    respond_with @resource, location: collection_path
  end

  def show
    @resource = resource_class.find(params[:id])
    respond_with @resource
  end

  def edit
    @resource = resource_class.find(params[:id])
    respond_with @resource
  end

  def update
    @resource = resource_class.find(params[:id])
    @resource.update_attributes(permitted_params)
    respond_with @resource, location: collection_path
  end

  def destroy
    @resource = resource_class.find(params[:id])
    @resource.destroy
    respond_with @resource, location: collection_path
  end

  private

  def collection_scope_with_search_scopes
    final_scope = collection_scope
    search_scopes.each do |scope|
      final_scope = final_scope.send(scope)
    end
    final_scope
  end

  def collection_scope
    resource_class
  end

  def search_scopes
    return [] unless params.has_key?(:q) && params[:q].has_key?(:scopes)
    params[:q][:scopes].keys - ['unscoped']
  end
end