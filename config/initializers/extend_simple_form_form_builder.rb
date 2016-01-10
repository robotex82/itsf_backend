if Itsf::Backend.gem_available?(:simple_form)

  require 'simple_form'
  SimpleForm::FormBuilder.send(:include, SimpleFormFormBuilderExtensions)
end
