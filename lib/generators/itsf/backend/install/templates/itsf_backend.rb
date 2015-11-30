Itsf::Backend.configure do |config|
  # Set the base controller
  #
  # Default: config.base_controller = 'ApplicationController'
  #
  config.base_controller = 'ApplicationController'

  # Register backend engines.
  # 
  # Default: config.register_backends = []
  # 
  config.register_backends = []
end