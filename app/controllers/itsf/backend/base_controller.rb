require 'ransack' if Itsf::Backend.features?(:ransack)

module Itsf::Backend
  class BaseController < Configuration.resource_base_controller.constantize
    include RestActionsConcern
    include ResourceUrlsConcern
    include ResourceInflectionsConcern

    helper_method :resource_class
    
    def self.resource_class
      name.gsub('Controller', '').constantize
    end
    
    def resource_class
      self.class.resource_class
    end
  end
end
