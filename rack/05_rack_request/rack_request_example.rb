require 'rubygems'
require 'rack'

class MyApp
  def call(env)
    request = Rack::Request.new(env)
    body = if request['q']
      "query: #{ request['q'].inspect }"
    else
      "no query"
    end
    [ 200, {}, body ]
  end
end

Rack::Handler::Thin.run MyApp.new