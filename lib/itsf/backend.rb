require 'itsf/backend/configuration'
require 'itsf/backend/features'
require 'itsf/backend/policies'

module Itsf
  module Backend
    extend Configuration
    extend Features
    extend Policies
  end
end
