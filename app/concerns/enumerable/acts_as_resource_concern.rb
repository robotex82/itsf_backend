  module Enumerable
    module ActsAsResourceConcern
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      module ClassMethods
        def collection
          self::COLLECTION
        end

        def all
          collection.collect do |datum|
            new(datum)
          end
        end

        def find(id)
          all.select { |resource| resource.to_param == id }.first
        end

        def first
          all.first
        end

        def count
          all.size
        end
      end
    end
  end