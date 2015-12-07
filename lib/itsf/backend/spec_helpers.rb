module Itsf
  module Backend
    module SpecHelpers
      def ensure_backend_engine_homepage(engine_class)
        expect(current_path).to eq(engine_path(engine_class))
      end

      def backend_path
        "#{itsf_backend_path}/"
      end

      def engine_path(engine_class)
        send("#{engine_class.engine_name}_path")
      end

      def link_to_controller_action(controller_class, action_name, instance = nil)
        if instance
          "link-to-#{controller_class.name.underscore.gsub('_controller', '').gsub(/[\/_]/, '-')}-#{instance.to_param}-#{action_name}"
        else
          "link-to-#{controller_class.name.underscore.gsub('_controller', '').gsub(/[\/_]/, '-')}-#{action_name}"
        end
      end

      def create_resource_instance_for_controller(controller_class)
        create(controller_class.resource_class.name.underscore.gsub('/', '_'))
      end

      def ensure_current_action(engine_class, controller_class, action_name, instance = nil)
        case action_name
        when :index
          expect(page).to have_content(controller_class.resource_class.model_name.human(count: :other))
        when :new
          expect(page).to have_content(I18n.t("itsf.backend.base.new.title", resource_name: controller_class.resource_class.model_name.human))
        when :show
          expect(page).to have_content(instance.try_all(*Itsf::Backend::Configuration.resource_title_methods))
        when :edit
          expect(page).to have_content(I18n.t("itsf.backend.base.edit.title", resource_name: instance.class.model_name.human))
        when :destroy
          expect(page).to have_content(instance.class.model_name.human(count: :other))
        end

        # Can't use this because of bug: undefined method `segment_keys' for nil:NilClass
        # expect(current_path).to eq(engine_class.routes.url_for(controller: controller_class.controller_name, action: action_name))
      end
    end
  end
end