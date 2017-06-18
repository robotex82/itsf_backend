module Controller
  module PaginationConcern
    private

    def load_collection
      super.page(params[:page]).per(pagination_size)
    end

    def pagination_size
      return collection_scope.count if params[:per_page] == 'all'
      params[:per_page] || Itsf::Backend::Configuration.default_pagination_size
    end
  end
end
