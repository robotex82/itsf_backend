class <%= controller_name %> < Itsf::Backend::BaseController
  private

  def resource_class
    "<%= class_name %>".constantize
  end
end
