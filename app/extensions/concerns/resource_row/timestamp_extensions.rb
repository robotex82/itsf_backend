require 'active_support/concern'

module ResourceRow
  module TimestampExtensions
    extend ActiveSupport::Concern

    def timestamps
      column(:created_at) { |resource| I18n.l(resource.created_at, format: :short) if resource.created_at.present? }
      column(:updated_at) { |resource| I18n.l(resource.updated_at, format: :short) if resource.updated_at.present? }
    end

    def column_timestamps
      ActiveSupport::Deprecation.warn('Do not use table.column_timestamps. Use table.timestamps instead!')
      timestamps
    end
  end
end