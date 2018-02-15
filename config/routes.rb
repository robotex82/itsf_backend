Itsf::Backend::Engine.routes.draw do
  scope :backend do
    root to: 'dashboard#index'
  end
end
