module Controller
  module PaginationConcern
    extend ActiveSupport::Concern

    private

    def load_collection
      collection_scope.page(params[:page]).per(pagination_size)
    end

    def pagination_size
      return collection_scope.total_count if params[:per_page] == 'all'
      params[:per_page] || Itsf::Backend::Configuration.default_pagination_size
    end
  end
end
