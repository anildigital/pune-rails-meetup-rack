!SLIDE subsection
# Rack & Rails

!SLIDE bullets incremental

# Rails
* Any Rails 3 application is a rack application
* Rails is a citizen in Rack ecosystem
* Sinatra & all other rack applications too!

!SLIDE bullets incremental

# Rails
* ActionController::Dispatcher.new is the primary Rack application object of a Rails application. 
* Any Rack compliant web server should be using ActionController::Dispatcher.new object to serve a Rails application.

!SLIDE smbullets incremental

# ActionDispatch

* http://github.com/rails/rails/tree/master/actionpack/lib/action_dispatch
* Middleware extracted from ActionController 
* ActionDispatch::MiddlewareStack 
* Request/Response objects 
* Routing
* Integration Testing Support

!SLIDE small incremental

##  Default Middleware 

    @@@ruby
    λ rake middleware
    
    use ActionDispatch::Static
    use Rack::Lock
    use Rack::Runtime
    use Rails::Rack::Logger
    use ActionDispatch::ShowExceptions
    use ActionDispatch::RemoteIp
    use Rack::Sendfile
    use ActionDispatch::Callbacks
    use ActionDispatch::Cookies
    use ActionDispatch::Session::CookieStore
    use ActionDispatch::Flash
    use ActionDispatch::ParamsParser
    use Rack::MethodOverride
    use ActionDispatch::Head
    use ActiveRecord::ConnectionAdapters::ConnectionManagement
    use ActiveRecord::QueryCache
    run Planet::Application.route


!SLIDE smaller
##ActionDispatch::MiddlewareStack



    @@@ruby
    require 'rack/cache' 
    require 'rack/contrib'

    module Planet
      class Application < Rails::Application
        # adds the new middleware at the bottom of the stack
        config.middleware.use Rack::Cache
   
        # adds the new middleware before an existing middleware
        config.middleware.insert_before Rack::Lock, Rack::ProcTitle
    
        # adds the new middleware after an existing middleware
        config.middleware.insert_after Rack::Head, Rack::CSSHTTPRequest
    
        # swap one middleware for another     
        config.middleware.swap ActionDispatch::ShowExceptions, SuperShowExceptions
    
        # remove a middleware from the stack     
        config.middleware.delete Rack::MethodOverride
      end
    end
    

!SLIDE smaller
##Actions = Rack Apps

    @@@code
    λ rails console
    Loading development environment (Rails 3.0.0.beta3)

    >> action = PagesController.action(:index)
    => #<Proc:0x0000000105897078@/Users/anil/.rvm/gems/ruby-1.8.7-p249/gems/actionpack-3.0.0.beta3/lib/action_controller/metal.rb:123> 
 
    >> action.respond_to?(:call)
    => true 
 



