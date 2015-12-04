require 'active_support/concern'

module HeadRow
  module TimestampExtensions
    extend ActiveSupport::Concern

    def column_timestamps
      column :created_at
      column :updated_at
    end
  end
end