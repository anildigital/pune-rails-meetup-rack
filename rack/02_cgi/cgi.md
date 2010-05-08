!SLIDE subsection
# CGI

!SLIDE small center bullets incremental
# CGI 

* A standard that defines how webserver software can delegate the generation of webpages to a console application. 
* Provides an interface between the webservers and the clients
* Servers identify the request from client and will invoke appropriate function to return the result to the requested clients.

!SLIDE ruby small

    @@@ruby
    # Simple CGI script
    
    require 'cgi'

    # Create a cgi object, with HTML 4 generation methods.
    cgi = CGI.new('html4')

    # Ask the cgi object to send some text 
    # out to the browser.
    
    cgi.out {
      cgi.html {
        cgi.body {
          cgi.h1 { 'Hello Ruby!' }
        }
      }
    }

!SLIDE small ruby
   
    @@@ ruby
    # Mongrel is a standalone webserver for ruby 
    # applications.
    # Simple example 
    
    require 'mongrel'

    class SimpleHandler < Mongrel::HttpHandler
      def process(request, response)
        response.start(200) do |head,out|
          head["Content-Type"] = "text/plain"
          out.write("Hello Ruby!\n")
        end
      end
    end
    
    h = Mongrel::HttpServer.new("0.0.0.0", "3000")
    h.register("/hello", SimpleHandler.new)
    h.run.join


!SLIDE bullets small incremental

# What is missing in these programs?

* Follow no standard protocol, could not mix it with sinatra / rails / similar easily.
* Second example runs only on mongrel
* No middleware