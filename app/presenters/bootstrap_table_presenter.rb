class BootstrapTablePresenter < Admino::Table::Presenter
  private

  def table_html_options
    { class: 'table table-striped table-hover table-admino table-scrollable table-condensed' }
  end

  def resource_row(resource, view_context)
    ResourceRow.new(resource, view_context)
  end

  class ResourceRow < Admino::Table::ResourceRow
    def to_html
      buffer = @columns

      if @actions.any?
        html_options = column_html_options(:actions)
        buffer << h.content_tag(:td, html_options) do
          actions_wrapper do
            @actions.join(" ").html_safe
          end
        end
      end

      buffer.html_safe
    end

    def actions_wrapper(&block)
      h.content_tag(:div, { class: 'btn-group' }, &block)
    end

    def edit_action_url
      view_context.edit_resource_url(resource)
    end

    def destroy_action_url
      view_context.resource_url(resource)
    end

    def show_action_html_options
      { class: 'btn btn-default btn-xs' }
    end

    def edit_action_html_options
      { class: 'btn btn-default btn-xs' }
    end

    def destroy_action_html_options
      {
        method: :delete,
        class: 'btn btn-danger btn-xs',
        data: {
          confirm: I18n.t('confirmations.delete')
        }
      }
    end
  end
end