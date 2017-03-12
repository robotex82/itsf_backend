module Bootstrap
  class AccordionMenu
    def initialize(view, options = {}, &block)
      options.reverse_merge!(identifier: SecureRandom.urlsafe_base64, icon: 'folder-open')

      @identifier = options.delete(:identifier)
      @title      = options.delete(:title)
      @icon      = options.delete(:icon)
      @view       = view
      @block      = block
    end

    def perform
       items = @view.capture { @block.call(self) }
       @view.render partial: 'bootstrap/accordion_menu', locals: { identifier: @identifier, title: @title, items: items, icon: @icon }
     end

    def item(options = {})
      options.reverse_merge!(icon: nil, target: nil, title: nil, item_count: nil)

      @view.render partial: 'bootstrap/accordion_menu/item', locals: options
    end
  end
end