module Itsf
  module Backend
    module BootstrapHelper
      def accordion_menu(options = {}, &block)
        Bootstrap::AccordionMenu.new(self, options, &block).perform
      end
    end
  end
end