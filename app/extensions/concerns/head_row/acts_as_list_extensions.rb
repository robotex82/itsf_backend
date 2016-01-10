require 'active_support/concern'

module HeadRow
  module ActsAsListExtensions
    extend ActiveSupport::Concern

    def acts_as_list(_options = {})
      column :acts_as_list
    end
  end
end
