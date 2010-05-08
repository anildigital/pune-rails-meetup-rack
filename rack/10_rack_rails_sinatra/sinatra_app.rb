require 'rubygems'
require 'sinatra'

module JaiHo
    class Application < Sinatra::Base
      get '/' do
        "Jai Ho"
      end
    end
end

app = Rack::Builder.app do
  run JaiHo::Application
end

Rack::Handler::Thin.run app, :Port => 4567