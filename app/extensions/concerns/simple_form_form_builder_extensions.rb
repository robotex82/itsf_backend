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
end
