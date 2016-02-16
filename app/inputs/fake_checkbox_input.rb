class FakeCheckboxInput < SimpleForm::Inputs::BooleanInput
  def input(wrapper_options = nil)
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)

    if template.params.has_key?(attribute_name)
      merged_input_options[:checked] = 'checked'
    end

    template.check_box_tag("#{attribute_name}", nil, merged_input_options.has_key?(:checked)) # , merged_input_options)

    # params_container_name = object.class.name.demodulize.underscore.to_sym

    # if template.params.has_key?(params_container_name) && template.params[params_container_name].has_key?(attribute_name)
    #   merged_input_options[:checked] = 'checked'
    # end

    # template.check_box_tag("#{params_container_name}[#{attribute_name}]", nil, false) # , merged_input_options)
  end
end