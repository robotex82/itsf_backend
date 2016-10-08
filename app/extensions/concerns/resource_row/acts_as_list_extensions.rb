require 'active_support/concern'

module ResourceRow
  module ActsAsListExtensions
    extend ActiveSupport::Concern

    def acts_as_list(options = {})
      options.reverse_merge!(scope: nil)

      scope = options.delete(:scope)

      scope = "#{scope}_id".intern if scope.is_a?(Symbol) && scope.to_s !~ /_id$/

      data_attributes = {
        'acts-as-list-item':                true,
        'acts-as-list-item-scope':          "#{scope}-#{resource.send(scope)}",
        'acts-as-list-item-uid':            resource.to_param,
        'acts-as-list-item-on-drop-target': h.url_for([:reposition, resource])
      }

      column(:acts_as_list) do |_resource|
        h.content_tag(:span, data: data_attributes, class: 'btn btn-xs btn-default acts-as-list-item') do
          h.tag(:span, class: 'glyphicon glyphicon-sort')
        end
      end
    end
  end
end
