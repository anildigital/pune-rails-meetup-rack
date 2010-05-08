!SLIDE bullets incremental small
# Rack::URLMap

* an extremely easy way to combine different web applications with
* takes a hash mapping urls or paths to apps, and dispatches accordingly

!SLIDE ruby smaller

    @@@ruby
    awesome_app = lambda { |env| 
                           [ 200, 
                             {"Content-Type" => "text/plain"}, 
                             ["Awesome!"]
                           ] 
                         }

    sweet_app = lambda { |env| 
                         [ 200, 
                           {"Content-Type" => "text/html"}, 
                           ["Sweet!"]
                         ] 
                       }

    map "/awesome" do
      run awesome_app
    end

    map "/sweet" do 
      run sweet_app
    end