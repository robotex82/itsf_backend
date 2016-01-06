# :nodoc:
module SimpleFormFormBuilderExtensions
  def editor(*args)
    options = args.extract_options!
    syntax = options.delete(:syntax)

    input_html = options.has_key?(:input_html) ? options[:input_html] : {}

    input_html['data-add-editor'] = true

    if syntax.present?
      input_html['data-editor-syntax'] = syntax
    end

    options[:input_html] = input_html

    input(*args, options)
  end

  def locale_input(attribute_name = :locale, _ = {})
    input_options = {
      collection: I18n.available_locales,
      as: :radio_buttons,
      item_label_class: "radio-inline",
      item_wrapper_tag: false
    }

    input attribute_name, input_options
  end
end
