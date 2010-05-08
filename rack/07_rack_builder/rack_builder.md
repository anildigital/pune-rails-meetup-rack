!SLIDE bullets incremental small
# Rack::Builder

* implements a small DSL to iteratively construct Rack applications.

!SLIDE small

    @@@ruby
    # this:
    builder = Rack::Builder.new do
      use Rack::ContentLength
      use Rack::ETag
      run app
    end

    app = builder.to_app

    # is the same as:
    app = Rack::ContentLength.new(Rack::ETag.new(app))
    

!SLIDE smbullets incremental
## config.ru & rackup
 
 * rackup, a useful tool for running Rack applications.
 * rackup takes config.ru as input
 * Uses the Rack::Builder DSL to configure middleware and build up applications easily
 * config.ru is itself is pure Rack application which is server agnostic