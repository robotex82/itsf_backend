module Routing
  module ItsfBackendResourceConcern
    extend ActiveSupport::Concern
    # Using this method instead of resources, adds member routes for pages added in the
    # itsf_backend configuration.
    # 
    def backend_resources(*args, &block)
      resources(*args, &block)

      # additional_member_actions = (Itsf::Backend::Configuration.default_resource_pages - [:show])

      # if additional_member_actions.any?
      #   resources_name = args.first
      #   resources resources_name, only: [] do
      #     member do
      #       additional_member_actions.each do |action|
      #         get action
      #       end
      #     end
      #   end
      # end

      additional_resource_route_blocks = Itsf::Backend::Configuration.additional_resource_route_blocks
      if additional_resource_route_blocks.any?
        resources_name = args.first
        additional_resource_route_blocks.each do |route_block|
          resources resources_name, only: [] do
            route_block.call(self)
          end
        end
      end
    end
  end
end