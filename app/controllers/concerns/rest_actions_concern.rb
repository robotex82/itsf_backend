module RestActionsConcern
  extend ActiveSupport::Concern

  included do
    respond_to :html
    responders :flash
  end

  def index
    @collection = resource_class.page(params[:page]).per(10)
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
end