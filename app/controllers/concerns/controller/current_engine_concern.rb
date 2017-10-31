module Controller
  module CurrentEngineConcern
    extend ActiveSupport::Concern

    included do
      helper_method :current_engine
    end

    private

    def current_engine
      if respond_to?(:engine)
        return engine
      end
      if respond_to?(:resource_class)
        registered_items = Itsf::Backend.backend_engines.collect { |e| e.name.gsub!('::Engine', '').constantize }.each_with_object({}) { |e, memo| memo[e] = e.registered_controllers.call }
      end
      if respond_to?(:service_class)
        registered_items = Itsf::Backend.backend_engines.collect { |e| e.name.gsub!('::Engine', '').constantize }.each_with_object({}) { |e, memo| memo[e] = e.registered_services.call }
      end
      if registered_items.present?
        engine_namespace = registered_items.find { |key, values| values.include?(self.class) }.first
        "#{engine_namespace}::Engine".constantize
      end
    end
  end
end
