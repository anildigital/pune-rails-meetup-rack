require 'rubygems'
require 'rack'

app = lambda { |env| [200, {"Content-Type" => "text/html"}, ["Hello World!"]]}

Rack::Handler::WEBrick.run app , :Port => 3000