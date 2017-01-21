module Itsf::Backend
  class EnginePolicy < Struct.new(:user, :engine)
    def access?
      permission_identifier = self.class.name.gsub('Policy', '').underscore
      allowed = user.respond_to?(:allowed_to?) ? user.allowed_to?(permission_identifier) : false

      if allowed
        Rails.logger.debug "User #{user.try_all(*Itsf::Backend.resource_title_methods)} is allowed to access #{permission_identifier}"
      else
        Rails.logger.debug "User #{user.try_all(*Itsf::Backend.resource_title_methods)} is not allowed to access #{permission_identifier}"
      end
      allowed
    end
  end
end
