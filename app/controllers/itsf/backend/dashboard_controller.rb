module Itsf::Backend
  class DashboardController < Configuration.dashboard_base_controller.constantize
    layout 'itsf/backend/base'

    def index
    end
  end
end
