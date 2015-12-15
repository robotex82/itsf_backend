require 'active_support/concern'

module ResourceRow
  module PaperclipExtensions
    extend ActiveSupport::Concern

    def thumbnail(attachment_name, options = {})
      options.reverse_merge!({ style: :original })
      style = options.delete(:style)

      attachment = resource.send(attachment_name)
      return column(attachment_name) unless attachment.respond_to?(:url)
      
      image_tag = h.image_tag(attachment.url(style))
      column(attachment_name) { |resource| h.link_to(image_tag, h.send("#{resource.class.name.demodulize.underscore}_path", resource)) }
    end
  end
end