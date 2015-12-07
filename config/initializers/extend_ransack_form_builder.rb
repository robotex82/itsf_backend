if Itsf::Backend.gem_available?(:ransack)
  require 'ransack'
  Ransack::Helpers::FormBuilder.send(:include, RansackFormBuilderExtensions)
end