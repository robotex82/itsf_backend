module Controller
  module ActsAsPublishedConcern
    extend ActiveSupport::Concern

    def toggle_published
      @resource = load_resource
      @resource.toggle_published!

      action_taken = @resource.published? ? 'published' : 'unpublished'
      resource_label = @resource.try_all(*Itsf::Backend::Configuration.resource_title_methods)
      if Rails.version < '5.0.0'
        redirect_to :back, notice: I18n.t("acts_as_published.flash.actions.toggle_published.notices.#{action_taken}", name: resource_label)
      else
        flash[:notice] = I18n.t("acts_as_published.flash.actions.toggle_published.notices.#{action_taken}", name: resource_label)
        redirect_back(fallback_location: main_app.root_path)
      end
    end
  end
end
