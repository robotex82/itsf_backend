module Concerns
  module Form
    module AdditionalSubmitButtons
      extend ActiveSupport::Concern

      def submit_and_continue_with_edit *args
        options = args.extract_options!
        action = object.new_record? ? :create : :update
        options.merge!(name: 'commit_and_continue_with_edit' ,value: I18n.t("helpers.submit.#{action}_and_continue_with_edit", resource_name: object.model_name.human))
        submit(options)
      end

      def submit_and_continue_with_new *args
        options = args.extract_options!
        action = object.new_record? ? :create : :update
        options.merge!(name: 'commit_and_continue_with_new' ,value: I18n.t("helpers.submit.#{action}_and_continue_with_new", resource_name: object.model_name.human))
        submit(options)
      end
    end
  end
end