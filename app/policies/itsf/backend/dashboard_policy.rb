module Itsf::Backend
  class DashboardPolicy < Struct.new(:user, :dashboard)
    def access?
      permission_identifier = self.class.name.gsub('Policy', '').underscore
      allowed = user.allowed_to?(permission_identifier)
      if allowed
        Rails.logger.info "Allowed access to #{permission_identifier} for #{user}"
      else
        Rails.logger.info "Denied access to #{permission_identifier} for #{user}"
      end
      allowed
    end
  end
end
