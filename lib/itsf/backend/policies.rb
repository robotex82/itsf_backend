module Itsf
  module Backend
    module Policies
      def policies
        Itsf::Backend::BasePolicy.subclasses
      end

      def policy_permissions
        policies.collect { |klass| klass.instance_methods(false) + klass.superclass.instance_methods(false).collect { |method_name| "#{klass.to_s.underscore}/#{method_name}" } }.flatten.delete_if { |method_name| method_name.to_s !~ /\?$/ }.collect { |permission| permission.chomp('?') }
      end
    end
  end
end
