module Controller
  module FriendlyIdConcern
    extend ActiveSupport::Concern

    private

    def load_scope
      resource_class.friendly
    end
  end
end
