require 'rubygems'
require 'rack'
require 'rack/lobster'

app = Rack::Lobster.new

# builder = Rack::Builder.new do
#   use Rack::ContentLength
#   use Rack::ETag
#   run app
# end
# 
# app = builder.to_app

# is the same as:
app = Rack::ContentLength.new(Rack::ETag.new(app))

Rack::Handler::Thin.run app