module Itsf::Backend
  class DashboardPolicy < Struct.new(:user, :dashboard)
    def access?
      permission_identifier = self.class.name.gsub('Policy', '').underscore
      allowed = user.respond_to?(:allowed_to?) ? user.allowed_to?(permission_identifier) : true
      if allowed
        Rails.logger.info "Allowed access to #{permission_identifier} for #{user}"
      else
        Rails.logger.info "Denied access to #{permission_identifier} for #{user}"
      end
      allowed
    end
  end
end
