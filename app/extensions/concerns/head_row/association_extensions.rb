require 'active_support/concern'

module HeadRow
  module AssociationExtensions
    extend ActiveSupport::Concern

    def association(association_name, options = {})
      options.reverse_merge!({ label_method: :name })
      label_method = options.delete(:label_method)

      column(association_name, sorting_options: [ "#{association_name}_#{label_method}", resource_klass.human_attribute_name(association_name) ])
    end
  end
end