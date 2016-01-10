module Controller
  module RansackConcern
    extend ActiveSupport::Concern

    private

    def collection_scope
      @q = collection_scope_with_search_scopes(resource_class).ransack(params[:q])
      @q.result(distinct: true)
    end

    def collection_scope_with_search_scopes(base_scope)
      final_scope = base_scope
      search_scopes.each do |scope|
        final_scope = final_scope.send(scope)
      end
      final_scope
    end

    def search_scopes
      return [] unless params.key?(:q) && params[:q].key?(:scopes)
      params[:q][:scopes].keys - ['unscoped']
    end
  end
end
