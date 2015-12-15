require 'active_support/concern'

module HeadRow
  module TimestampExtensions
    extend ActiveSupport::Concern

    def timestamps
      column :created_at
      column :updated_at
    end

    def column_timestamps
      ActiveSupport::Deprecation.warn('Do not use table.column_timestamps. Use table.timestamps instead!')
      timestamps
    end
  end
end