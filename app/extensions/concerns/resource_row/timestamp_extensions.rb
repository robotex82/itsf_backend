require 'active_support/concern'

module ResourceRow
  module TimestampExtensions
    extend ActiveSupport::Concern

    def timestamp(attribute_name, options = {})
      options.reverse_merge!(format: :short)
      format = options.delete(:format)
      column(attribute_name) { |resource| I18n.l(resource.send(attribute_name), format: format) if resource.send(attribute_name).present? }
    end

    def timestamps
      timestamp :created_at
      timestamp :updated_at
    end

    def column_timestamps
      ActiveSupport::Deprecation.warn('Do not use table.column_timestamps. Use table.timestamps instead!')
      timestamps
    end
  end
end
