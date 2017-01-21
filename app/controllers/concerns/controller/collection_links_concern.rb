module Controller
  module CollectionLinksConcern
    extend ActiveSupport::Concern

    included do
      helper_method :collection_links
    end

    private

    def collection_links
      Itsf::Backend.collection_links
    end
  end
end