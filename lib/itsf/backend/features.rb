module Itsf
  module Backend
    module Features
      def features?(name)
        Gem::Specification.find_all_by_name(name.to_s).any?
      end
    end
  end
end