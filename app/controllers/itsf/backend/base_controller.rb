module Itsf::Backend
  class BaseController < ApplicationController
    include RestActionsConcern
    include ResourceUrlsConcern
    include ResourceInflectionsConcern

    prepend_view_path Rails.root.join(*%w(admin views))

    helper_method :resource_class
    
    def self.resource_class
      name.gsub('Controller', '').constantize
    end

    # private

    # def resource_class
    #   controller_name.classify.constantize
    # end
    
    def resource_class
      self.class.resource_class
    end
  end
end
