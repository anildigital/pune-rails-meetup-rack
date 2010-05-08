!SLIDE bullets incremental small

# Rack::Response
* Wrapper around response i.e. [status, header, body]
* Use it for writing complex middlewares

!SLIDE smaller

## HTTP Response



    @@@code
    HTTP/1.1 200 OK 
    Connection: close 
    Date: Tue, 16 Feb 2010 23:49:18 GMT 
    Content‐Type: text/plain 
    Content‐Length: 11 
    Cache‐Control: max‐age=60


    Hello World
    
!SLIDE smaller

##Rack Response

    @@@code
    [ 200, 
      {'Content‐Type' => 'text/plain',    
       'Content‐Length' => '11',    
       'Cache‐Control' => 'max‐age=60'},   
      ["Hello World"] 
    ]

!SLIDE smaller code

    @@@ruby
    response = Rack::Response.new('Hello World!') 
    response.set_cookie('sess-id', 'abcde') 
    response.finish