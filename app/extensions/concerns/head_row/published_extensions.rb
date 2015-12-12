require 'active_support/concern'

module HeadRow
  module PublishedExtensions
    extend ActiveSupport::Concern

    def column_published_actions
      column :published_actions
    end
  end
end