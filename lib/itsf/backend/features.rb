module Itsf
  module Backend
    module Features
      def gem_available?(name)
        Gem::Specification.find_all_by_name(name.to_s).any?
      end

      def features?(name)
        Gem::Specification.find_all_by_name(name.to_s).any? && Itsf::Backend::Configuration.enabled_features.include?(name)
      end
    end
  end
end
