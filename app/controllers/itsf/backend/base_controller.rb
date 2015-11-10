module Itsf::Backend
  class BaseController < ApplicationController
    include RestActionsConcern
    include ResourceUrlsConcern
    include ResourceInflectionsConcern

    prepend_view_path Rails.root.join(*%w(admin views))

    helper_method :resource_class

    private

    def resource_class
      controller_name.classify.constantize
    end
  end
end
