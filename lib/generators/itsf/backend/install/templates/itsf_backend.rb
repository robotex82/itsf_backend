Itsf::Backend.configure do |config|
  # Set the base controller
  #
  # Default: config.base_controller = 'BackendController'
  #
  config.base_controller = 'BackendController'

  # Register backend engines here. They will be  added to the backend menu
  # 
  # Example: config.backend_engines = [ MyEngine::Engine ]
  # 
  # Default: config.backend_engines = []
  # 
  config.backend_engines = []

  # Proc that will be used to build the backend title link. The first and only 
  # argument is the view.
  # 
  # Default: config.title_link = Proc.new do |view|
  #            view.link_to(
  #              view.t('.title', application_name: Rails.application.class.parent_name.underscore.titleize),
  #              view.main_app.itsf_backend_path,
  #              class: 'navbar-brand'
  #            )
  #          end
  config.title_link = Proc.new do |view|
    view.link_to(
      view.t('.title', application_name: Rails.application.class.parent_name.underscore.titleize),
      view.main_app.itsf_backend_path,
      class: 'navbar-brand'
    )
  end

  # Proc that will be used to mount engines.
  # 
  # Default:
  # 
  # config.engine_mount_point = Proc.new { |router, engine|
  #   router.mount(
  #     engine => I18n.t(
  #       "routes.mount.#{engine.engine_name}",
  #       default: "/#{engine.name.deconstantize.underscore}"
  #     )
  #   )
  # }
  config.engine_mount_point = Proc.new { |router, engine|
    router.mount(
      engine => I18n.t(
        "routes.mount.#{engine.engine_name}",
        default: "/#{engine.name.deconstantize.underscore}"
      )
    )
  }
end