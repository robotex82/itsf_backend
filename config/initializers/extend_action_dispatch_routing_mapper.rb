ActionDispatch::Routing::Mapper.send(:include, Routing::ItsfBackendResourceConcern)
ActionDispatch::Routing::Mapper.send(:include, Routing::ServiceConcern)