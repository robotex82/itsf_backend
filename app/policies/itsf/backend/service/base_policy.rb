module Itsf::Backend
  class Service::BasePolicy
    attr_reader :user, :service

    def initialize(user, service)
      @user = user
      @service = service
    end

    def index?
      authorize_with_rbac(user, service, __method__)
    end

    def invoke?
      authorize_with_rbac(user, service, __method__)
    end

    def call?
      invoke?
    end

    private

    def authorize_with_rbac(user, service_class, method_name)
      permission_identifier = "#{service_class.name.underscore}/#{method_name.to_s.chomp('?')}"
      user.respond_to?(:allowed_to?) ? user.allowed_to?(permission_identifier) : true
    end
  end
end
