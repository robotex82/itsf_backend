module Controller
  module PunditNamespacedAuthorizeConcern
    extend ActiveSupport::Concern

    def authorize(policy, action, namespace = nil)
      policy = "#{namespace}::#{policy.to_s.camelize}".to_sym if namespace.present?
      super(policy, action)
    end

    def engine_policy(engine)
      policy_name = engine.name.to_sym
      policy(policy_name)
    end
  end
end
