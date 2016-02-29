module Concerns
  module Form
    module UiAutocomplete
      extend ActiveSupport::Concern

      def autocomplete(attribute, options = {})
        options.reverse_merge!(url: -> { url_for(action: attribute, format: :json) })
        url = options.delete(:url)
        input attribute, as: :string, input_html: { class: 'ui-autocomplete-input', :'data-source-url' => url.call }
      end
    end
  end
end