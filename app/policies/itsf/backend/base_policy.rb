module Itsf::Backend
  class BasePolicy
    attr_reader :user, :record

    def initialize(user, record)
      @user = user
      @record = record
    end

    def index?
      # false
      authorize_with_rbac(user, record, __method__)
    end

    def show?
      scope.where(id: record.id).exists?
    end

    def create?
      # false
      authorize_with_rbac(user, record, __method__)
    end

    def new?
      create?
    end

    def update?
      # false
      authorize_with_rbac(user, record, __method__)
    end

    def edit?
      update?
    end

    def destroy?
      # false
      authorize_with_rbac(user, record, __method__)
    end

    def scope
      Pundit.policy_scope!(user, record.class)
    end

    class Scope
      attr_reader :user, :scope

      def initialize(user, scope)
        @user = user
        @scope = scope
      end

      def resolve
        scope
      end
    end

    private

    def authorize_with_rbac(user, record, method_name)
      resource_name = record.class == Class ? record.name : record.class.name
      permission_identifier = "#{resource_name.underscore}/#{method_name.to_s.chomp('?')}"
      user.allowed_to? permission_identifier
    end
  end
end
