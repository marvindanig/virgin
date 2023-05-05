module virgin
  #A Rails Engine for managing environment specific virgins.txt files
  class Engine < Rails::Engine
    isolate_namespace virgin

    initializer "virgin rounting" do
      require "virgin/routing"
      ActionDispatch::Routing::Mapper.send(:include, virgin::Routing)
    end
  end
end
