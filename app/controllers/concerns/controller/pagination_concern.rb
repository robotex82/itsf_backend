module Controller
  module PaginationConcern
    extend ActiveSupport::Concern

    private

    def pagination_size
      Itsf::Backend::Configuration.default_pagination_size
    end
  end
end
