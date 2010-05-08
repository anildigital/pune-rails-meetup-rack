require 'rubygems'
require 'rack'

class MyApp
  def call(env)
    request  = Rack::Request.new(env)
    response = Rack::Response.new
    
    response["Content-Type"] = "text/plain"
    response.write("<h1>Hello World!</h1>")
    
    response.finish
  end
end

Rack::Handler::Thin.run MyApp.new