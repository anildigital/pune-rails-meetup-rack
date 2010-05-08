!SLIDE bullets incremental small
# Rack::Request
* Wrapper around request environment headers
* Use it for writing complex middlewares

!SLIDE smaller

##HTTP Request


    @@@code
    GET /hello 
    HTTP/1.1 
    Host: localhost:9292 
    Connection: keep‐alive 
    User‐Agent: Mozilla/5.0 (Macinto... 
    Accept: application/xml,applicati... 
    Accept‐Encoding: gzip,deflate,sdch 
    Accept‐Language: en‐US,en;q=0.8 
    Accept‐Charset: UTF‐8,*;q=0.5 
    Cache‐Control: max‐age=0 
    Cookie: foo=bar
    
    
!SLIDE  smaller 
##Rack "env" Hash


    @@@code
    {"REQUEST_METHOD"=>"GET",  
    "PATH_INFO"=>"/hello",  
    "SCRIPT_NAME"=>"", 
    "SERVER_NAME"=>"localhost",  
    "SERVER_PORT"=>"9292",  
    "REMOTE_ADDR"=>"127.0.0.1",  
    "QUERY_STRING"=>"",
    "HTTP_HOST"=>"localhost:9292",  
    "HTTP_CONNECTION"=>"keep‐alive",  
    "HTTP_USER_AGENT"=>"Mozilla/5.0 (...",  
    "HTTP_ACCEPT"=>"application/xml,a...",  
    "HTTP_ACCEPT_ENCODING"=>"gzip,def...",  
    "HTTP_ACCEPT_LANGUAGE"=>"en‐US,en...",  
    "HTTP_ACCEPT_CHARSET"=>"UTF‐8,*;q=0.5",  
    "HTTP_CACHE_CONTROL"=>"max‐age=0",  
    "HTTP_COOKIE"=>"foo=bar",  
    "rack.url_scheme"=>"http",  
    "rack.input"=>#<StringIO:0x10841ec>,  
    "rack.errors"=>#<IO:0x3a8d4c>,  
    "rack.version"=>[1, 1],  
    "rack.run_once"=>false,  
    "rack.multithread"=>true,  
    "rack.multiprocess"=>false}