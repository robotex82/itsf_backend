module Itsf
  module Backend
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc 'Generates the intializer'

        source_root File.expand_path('../templates', __FILE__)

        def generate_intializer
          copy_file 'initializer.rb', 'config/initializers/001_itsf_backend.rb'
        end

        def generate_routes
          route File.read(File.join(File.expand_path('../templates', __FILE__), 'routes.source'))
        end

        def generate_controller
          copy_file 'backend_controller.rb', 'app/controllers/backend_controller.rb'
        end
        
        def generate_route_translator_initializer
          copy_file 'route_translator.rb', 'config/route_translator.rb'
        end
      end
    end
  end
end
