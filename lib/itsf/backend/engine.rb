module Itsf
  module Backend
    class Engine < ::Rails::Engine
      isolate_namespace Itsf::Backend

      config.generators do |g|
        g.test_framework      :rspec,        :fixture => false
        g.fixture_replacement :factory_girl, :dir => 'spec/factories'
        g.assets false
        g.helper false
      end
    end
  end
end



