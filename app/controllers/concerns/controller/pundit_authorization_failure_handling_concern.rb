module Controller
  module PunditAuthorizationFailureHandlingConcern
    extend ActiveSupport::Concern

    included do
      rescue_from Pundit::NotAuthorizedError, with: :not_authorized
    end

    private

    def not_authorized(exception)
      resource_name   = exception.record.respond_to?(:model_name) ? exception.record.model_name.human : exception.record
      collection_name = exception.record.respond_to?(:model_name) ? exception.record.model_name.human(count: :other) : exception.record
      flash[:error] = I18n.t("pundit.not_authorized.#{action_name}", collection_name: collection_name,resource_name: resource_name)
      respond_to do |format|
        format.html { redirect_to main_app.root_path }
        format.json { render json: { error: 'not authorized' }, status: 403 }
      end
    end
  end
end
