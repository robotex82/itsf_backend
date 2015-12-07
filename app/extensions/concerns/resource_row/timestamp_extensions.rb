require 'active_support/concern'

module ResourceRow
  module TimestampExtensions
    extend ActiveSupport::Concern

    def column_timestamps
      column(:created_at) { |resource| I18n.l(resource.created_at, format: :short) if resource.created_at.present? }
      column(:updated_at) { |resource| I18n.l(resource.updated_at, format: :short) if resource.updated_at.present? }
    end
  end
end