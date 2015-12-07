class BootstrapTablePresenter < Admino::Table::Presenter
  private

  def table_html_options
    { class: 'table table-striped table-hover table-admino table-scrollable table-condensed' }
  end

  def head_row(collection_klass, query, view_context)
    HeadRow.new(collection_klass, query, view_context)
  end

  def resource_row(resource, view_context)
    ResourceRow.new(resource, view_context)
  end

  class HeadRow < Admino::Table::HeadRow
    def column(*args, &block)
      attribute_name, label, html_options = parse_column_args(args)

      if label.nil?
        label = column_label(attribute_name)
      elsif label.is_a? Symbol
        label = column_label(label)
      end

      html_options = complete_column_html_options(
        attribute_name,
        html_options
      )

      # sorting_scope = html_options.delete(:sorting)
      # sorting_html_options = html_options.delete(:sorting_html_options) { {} }

      # if sorting_scope
      #   raise ArgumentError, 'query object is required' unless query
      #   label = query.sorting.scope_link(sorting_scope, label, sorting_html_options)
      # end
      if Itsf::Backend.features?(:ransack)
        html_options.reverse_merge!(sortable: true, sortable_options: [])
        sortable = html_options.delete(:sortable)
        sortable_options = html_options.delete(:sortable_options)
        if sortable_options.empty?
          sortable_options << attribute_name
          sortable_options << resource_klass.human_attribute_name(attribute_name) 
        end


        if sortable
          label = h.sort_link(h.instance_variable_get("@q"), *sortable_options)
          # label = h.sort_link(h.instance_variable_get("@q"), attribute_name)
        else
          label = label.to_s
        end
      end

      @columns << h.content_tag(:th, label, html_options)
    end
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