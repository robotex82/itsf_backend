module Controller
  module ResourceLinksConcern
    extend ActiveSupport::Concern

    # included do
    #   helper_method :resource_pages
    # end

    # private

    # def resource_pages
    #   # Itsf::Backend::Configuration.default_resource_pages + 
    #   Itsf::Backend::Configuration.resource_pages.map { |arp| arp.respond_to?(:call) ? arp.call(self) : arp.to_sym }.compact
    # end

    included do
      helper_method :resource_links
    end

    private

    def resource_links
      Itsf::Backend.resource_links
    end
  end
end