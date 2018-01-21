module Controller
  module BreadcrumbsConcern
    extend ActiveSupport::Concern

    included do
      helper_method :breadcrumbs
    end

    def breadcrumbs
      @breadcrumbs ||= breadcrumbs!
    end

    def breadcrumbs!
      [].tap do |breadcrumbs|
        breadcrumbs << { label: t('controller.breadcrumbs_concern.home'), url: send("itsf_backend_#{I18n.locale}").root_path, link_html_options: {}, li_html_options: {}}
     
        if respond_to?(:current_engine, true) && current_engine.present?
          breadcrumbs << { label: t("classes.#{current_engine.name.underscore}"), url: send("#{current_engine.engine_name}_#{I18n.locale}").root_path, link_html_options: {}, li_html_options: {} }
        end
        
        if respond_to?(:resource_class, true)
          breadcrumbs << { label: resource_class.model_name.human(count: :other), url: url_for(action: :index), link_html_options: {}, li_html_options: {} }
        end

        if @resource.present? && @resource.persisted?
          breadcrumbs << { label: @resource.try_all(*Itsf::Backend.resource_title_methods), url: url_for(action: :show, id: @resource.to_param), link_html_options: {}, li_html_options: {} }
        end
        
        if respond_to?(:service_class, true)
          breadcrumbs << { label: t("classes.#{service_class.name.underscore}"), url: url_for(action: :index), link_html_options: {}, li_html_options: {} }
        end

        if %w(new create edit update invoke call).include?(action_name)
          breadcrumbs << { label: t("controller.breadcrumbs_concern.#{action_name}"), url: '#', link_html_options: {}, li_html_options: {} }
        end
        
        if params[:page].present?
          breadcrumbs << { label: t('controller.breadcrumbs_concern.page', page_number: params[:page]), url: '#', link_html_options: {}, li_html_options: {} }
        end
        
        breadcrumbs.last[:li_html_options][:class] = 'active'
      end
    end
  end
end