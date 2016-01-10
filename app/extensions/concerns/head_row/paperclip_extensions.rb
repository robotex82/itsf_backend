require 'active_support/concern'

module HeadRow
  module PaperclipExtensions
    extend ActiveSupport::Concern

    def thumbnail(attachment_name, _options = {})
      column(attachment_name)
    end
  end
end
