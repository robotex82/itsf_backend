module Itsf::Backend
  class EnginePolicy < Struct.new(:user, :engine)
    def access?
      permission_name = self.class.name.gsub('Policy', '').underscore
      allowed = user.allowed_to? permission_name
      if allowed
        Rails.logger.debug "User #{user} is allowed to access #{permission_name}"
      else
        Rails.logger.debug "User #{user} is not allowed to access #{permission_name}"
      end
      allowed
    end
  end
end
