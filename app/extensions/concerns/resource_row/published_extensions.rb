require 'active_support/concern'

module ResourceRow
  module PublishedExtensions
    extend ActiveSupport::Concern

    def column_published_actions
      link_path = view_context.controller.url_for(action: :toggle_published, id: resource.to_param)
      column(:column_published_actions) do |resource|
        if resource.published?
          view_context.button_to(link_path, class: 'btn btn-xs btn-danger btn-responsive', method: :post) do
            view_context.content_tag(:span, nil, class: 'glyphicon glyphicon-eye-close') +
              view_context.content_tag(:span, view_context.t('.unpublish', default: view_context.t('acts_as_published.actions.unpublish')), class: 'btn-text')
          end
        else
          view_context.button_to(link_path, class: 'btn btn-xs btn-success btn-responsive', method: :post) do
            view_context.content_tag(:span, nil, class: 'glyphicon glyphicon-eye-open') +
              view_context.content_tag(:span, view_context.t('.publish', default: view_context.t('acts_as_published.actions.publish')), class: 'btn-text')
          end
        end
      end
    end
  end
end
