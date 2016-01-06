require 'active_support/concern'

module HeadRow
  module TimestampExtensions
    extend ActiveSupport::Concern

    def timestamp(attribute_name, options = {})
      column attribute_name
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