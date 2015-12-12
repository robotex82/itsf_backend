require 'active_support/concern'

module HeadRow
  module ActsAsListExtensions
    extend ActiveSupport::Concern

    def acts_as_list(options = {})
      column :acts_as_list
    end
  end
end
