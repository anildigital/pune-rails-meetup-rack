require 'rubygems'
require 'rack'

awesome_app = lambda {|env| [200, {"Content-Type" => "text/plain"}, ["Awesome!"]] }

sweet_app = lambda {|env| [200, {"Content-Type" => "text/html"}, ["Sweet!"]] }

app = Rack::Builder.app do
  
  map "/awesome" do
    run awesome_app
  end

  map "/sweet" do 
    run sweet_app
  end
  
end
# 
# app = Rack::URLMap.new(
#   "/awesome" => awesome_app,
#   "/sweet" => sweet_app
# )

Rack::Handler::Thin.run app 