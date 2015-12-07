module Itsf::Backend
  class BaseController < Configuration.resource_base_controller.constantize
    include RestActionsConcern
    include ResourceUrlsConcern
    include ResourceInflectionsConcern

    # prepend_view_path Rails.root.join(*%w(admin views))

    helper_method :resource_class
    
    def self.resource_class
      name.gsub('Controller', '').constantize
    end
    
    def resource_class
      self.class.resource_class
    end
  end
end
