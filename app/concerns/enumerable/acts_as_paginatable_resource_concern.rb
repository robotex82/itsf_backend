  module Enumerable
    module ActsAsPaginatableResourceConcern
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      module ClassMethods
        def page(page)
          Kaminari.paginate_array(all).page(page)
        end
      end
    end
  end