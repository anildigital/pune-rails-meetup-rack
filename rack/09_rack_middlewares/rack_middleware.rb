# http://vision-media.ca/resources/ruby/ruby-rack-middleware-tutorial
require 'rubygems'
require 'rack'

# Rack::Upcase middleware
module Rack
  class Upcase
    def initialize app
      @app = app
    end
    
    def call env
      puts 'upcase'
      p @app
      puts
      status, headers, body = @app.call env
      [status, headers, [body.first.upcase]]
    end
  end
end

# Rack::Reverse middleware
module Rack
  class Reverse
    def initialize app
      @app = app
    end
    
    def call env
      puts 'reverse'
      p @app
      puts
      status, headers, body = @app.call env
      [status, headers, [body.first.reverse]]
    end
  end
end

app = Rack::Builder.new do
  
  use Rack::Upcase
  #use Rack::Reverse
  use Rack::ContentLength

  run lambda { |env| [200, { 'Content-Type' => 'text/html' }, 'Hello World'] }
  
end

if __FILE__ == $0
  Rack::Handler::Thin.run app
end