module Itsf
  module Backend
    module Generators
      class InstallGenerator < Rails::Generators::Base
        desc 'Generates the intializer'

        source_root File.expand_path('../templates', __FILE__)

        def generate_intializer
          copy_file 'itsf_backend.rb', 'config/initializers/itsf_backend.rb'
        end
      end
    end
  end
end