class <%= controller_name %> < Itsf::Backend::BaseController
  def self.resource_class
    <%= class_name %>
  end

  private

  def permit_params
    params
      .require()
        .permit()
  end
end
