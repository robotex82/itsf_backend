module Itsf
  module Backend
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc 'Generates the intializer'

        source_root File.expand_path('../templates', __FILE__)

        def generate_intializer
          copy_file 'itsf_backend.rb', 'config/initializers/itsf_backend.rb'
        end

        def generate_routes
          route File.read(File.join(File.expand_path('../templates', __FILE__), 'routes.source'))
        end

        def generate_controller
          copy_file 'backend_controller.rb', 'app/controllers/backend_controller.rb'
        end
      end
    end
  end
end