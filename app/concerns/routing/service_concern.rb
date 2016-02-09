module Routing
  module ServiceConcern
    extend ActiveSupport::Concern
    
    def service(service_name)
      resources service_name, only: [:index] do
        get  :invoke, on: :collection
        post :call,   on: :collection
      end
    end
  end
end