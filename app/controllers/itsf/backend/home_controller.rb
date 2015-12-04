module Itsf::Backend
  class HomeController < ApplicationController
    layout 'itsf/backend/base'

    helper_method :engine

    def self.engine
      "#{name.deconstantize}::Engine".constantize
    end

    def engine
      self.class.engine
    end

    def index
    end
  end
end
