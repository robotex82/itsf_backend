require 'simple_form/form_builder'

require 'concerns/form/ui_autocomplete'
SimpleForm::FormBuilder.send(:include, Concerns::Form::UiAutocomplete)

require 'concerns/form/additional_submit_buttons'
SimpleForm::FormBuilder.send(:include, Concerns::Form::AdditionalSubmitButtons)