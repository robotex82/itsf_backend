# :nodoc:
module RansackFormBuilderExtensions
  def search(attribute_name, options = {})
    options.reverse_merge!(label_options: {}, text_field_options: {})
    autofocus = options[:autofocus]

    label_options = options.delete(:label_options)

    text_field_options = options.delete(:text_field_options)
    text_field_options.reverse_merge!(class: 'form-control', 'data-autofocus': autofocus)
    if [:last, true].include?(autofocus)
      text_field_options.reverse_merge!(autofocus: true)
    end

    label(attribute_name, label_options) +
      text_field(attribute_name, text_field_options)

    # placeholder = true

    # if placeholder
    #   text_field_options.reverse_merge!(placeholder: true)
    #   text_field(attribute_name, text_field_options)
    # else
    #   label(attribute_name, label_options) +
    #     text_field(attribute_name, text_field_options)
    # end
  end

  def full_text_search(*args)
    options = args.extract_options!
    attribute_names = *args
    attribute_connector = '_or_'
    search_field_name = "#{attribute_names.join(attribute_connector)}_cont"
    search(search_field_name, options)
  end

  def locale_select
    input :locale_eq, as: :select, collection: I18n.available_locales.collect { |l| [l.to_s, l.to_s]}, include_blank: true
  end

  def scope(scope_name)
    t = @template
    value = t.params.has_key?(:q) && t.params[:q].has_key?(:scopes) && t.params[:q][:scopes].has_key?(scope_name) && t.params[:q][:scopes][scope_name] == '1'
    t.content_tag(:div, class: 'checkbox btn btn-default btn-xs') do
      t.content_tag(:label) do
        t.check_box_tag("q[scopes][#{scope_name}]", "1", value) +
        t.t("activerecord.scopes.#{scope_name}")
      end
    end
  end
end
