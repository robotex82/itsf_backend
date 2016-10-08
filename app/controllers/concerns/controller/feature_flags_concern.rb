module Controller
  # Adds an api to toggle features at controller level.
  # 
  # Assume you have ransack enabled globally (Itsf::Backend.features?(:ransach) == true),
  # but you can't use ransack in a specific controller, than you overwrite disabled_features
  # in the controller and make it return an array with :ransack inside of it:
  # 
  # def disabled_features
  #   [:ransack]
  # end
  # 
  # Then you can ask features?(:ransack) in the view and it will return false,
  # although ransack is enabled globally.
  # 
  module FeatureFlagsConcern
    extend ActiveSupport::Concern

    included do
      helper_method :features?
    end

    private

    # Ask featuers?(:foo) in the controller or your views to find out, if a
    # feature is enabled in this controller.
    def features?(what)
      Itsf::Backend.features?(what) && !disabled_features.include?(what)
    end

    # overwrite this method, to disable features.
    def disabled_features
      []
    end
  end
end