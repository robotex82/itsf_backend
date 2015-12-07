module Itsf
  module Backend
    module Generators
      class HomeControllerGenerator < Rails::Generators::NamedBase
        desc 'Generates a backend engine home controller for the given engine (i.e. MyEngine). Use the --skip-namespace option, if you are using a nested namespace and get a doubled top namespace.'

        source_root File.expand_path('../templates', __FILE__)


        def test
          p class_name
          p class_path
          p file_path
          p human_name
          p i18n_scope
          # p indent
          p index_helper
          # p inside_template
          p inside_template?
          # p module_namespacing
          p mountable_engine?
          p namespace
          p namespaced?
          # p namespaced_class_path
          # p namespaced_file_path
          # p namespaced_path
          p plural_file_name
          p plural_name
          p plural_table_name
          p pluralize_table_names?
          p regular_class_path
          p route_url
          p singular_name
          p singular_table_name
          p table_name
          # p template
          p uncountable?
          # p wrap_with_namespace

          p controller_namespace
          p controller_base_path
          p home_controller_file_path
          p home_controller_file_name
        end

        def generate_controller
          template "home_controller.rb", File.join(home_controller_file_path, home_controller_file_name)
        end

        def generate_routes
          route File.read(File.join(File.expand_path('../templates', __FILE__), 'routes.source'))
        end

        private

        def controller_namespace
          namespace
        end

        def controller_base_path
          File.join(*%w(app controllers))
        end

        def home_controller_file_path
          File.join(controller_base_path, file_path)
        end

        def home_controller_file_name
          'home_controller.rb'
        end
      end
    end
  end
end