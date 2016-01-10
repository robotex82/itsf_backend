module ObjectExtensions
  def try_all(*methods)
    methods.map(&:to_sym).each do |method|
      next unless respond_to?(method)
      return send(method)
    end
  end
end
