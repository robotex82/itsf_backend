require 'active_support/concern'

module ResourceRow
  module AssociationExtensions
    extend ActiveSupport::Concern

    def association(association_name, options = {})
      options.reverse_merge!({ label_method: :name })
      label_method = options.delete(:label_method)
      associated = resource.send(association_name)

      label = associated.respond_to?(label_method) ? associated.send(label_method) : nil
      
      if label.present?
        link_method_name = "#{associated.class.name.demodulize.underscore}_path"
        column(association_name) { |resource| h.link_to(label, h.send(link_method_name, associated)) }
      else
        column(association_name)
      end
    end
  end
end