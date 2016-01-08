module Controller
  module RestActionsConcernWithPundit
    extend ActiveSupport::Concern

    included do
      respond_to :html
      responders :flash
    end

    def index
      if Itsf::Backend.features?(:ransack)
        @q = collection_scope_with_search_scopes.ransack(params[:q])
        @collection = @q.result.page(params[:page]).per(pagination_size)
      else
        @collection = collection_scope.page(params[:page]).per(pagination_size)
      end
      authorize_action
      respond_with @collection
    end

    def new
      @resource = resource_class.new
      authorize_action
      respond_with @resource
    end

    def create
      @resource = resource_class.new(permitted_params)
      authorize_action
      @resource.save
      respond_with @resource, location: collection_path
    end

    def show
      @resource = load_resource
      authorize_action
      respond_with @resource
    end

    def edit
      @resource = load_resource
      authorize_action
      respond_with @resource
    end

    def update
      @resource = load_resource
      authorize_action
      @resource.update_attributes(permitted_params)
      respond_with @resource, location: collection_path
    end

    def destroy
      @resource = load_resource
      authorize_action
      @resource.destroy
      respond_with @resource, location: collection_path
    end

    private

    def authorize_action
      action = action_name.to_sym
      case action
      when :index
        authorize resource_class, :index?
      else
        authorize @resource, "#{action}?".to_sym
      end
    end

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

    def load_resource
      resource_class.find(params[:id])
    end

    def search_scopes
      return [] unless params.has_key?(:q) && params[:q].has_key?(:scopes)
      params[:q][:scopes].keys - ['unscoped']
    end
  end
end