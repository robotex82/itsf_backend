module Itsf
  module Backend
    module Generators
      class ResourceGenerator < Rails::Generators::NamedBase
        desc 'Generates an admin reource'

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

          p admin_controller_file_path
          p admin_controller_file_name
          p controller_base_path
          p controller_name
        end



        def generate_controller
          template "controller.rb", File.join(admin_controller_file_path, admin_controller_file_name)
        end

        def generate_route
        end

        private

        def admin_controller_file_path
          File.join controller_base_path, *class_path, 'backend'
        end

        def admin_controller_file_name
          "#{plural_name}_controller.rb"
        end

        def controller_base_path
          %w(app controllers)
        end

        def controller_name
          "#{module_namespace}::Backend::#{demodulized_class_name.pluralize}Controller"
        end

        def demodulized_class_name
          class_name.demodulize
        end

        def module_namespace
          class_path.join('/').camelize
        end
      end
    end
  end
end