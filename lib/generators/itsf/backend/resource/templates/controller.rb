class <%= controller_name %> < Itsf::Backend::BaseController
  def self.resource_class
    # Set the resource class here.
    #
    # Default: <%= class_name %>
    #
    <%= class_name %>
  end

  private

  def collection_scope
    # Customize the collection scope here for collection retrival (i.e. for the
    # index action).
    #
    # Example: current_user.posts.includes(:comments)
    #
    # Default: resource_class
    #
    resource_class
  end

  def permit_params
    # Set the allowed params, for your create and update methods.
    # 
    # Example: params
    #            .require(:<%= params_key %>)
    #              .permit(:title, :body)
    # 
    params
      .require(:<%= params_key %>)
        .permit()
  end
end
