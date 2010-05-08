require 'rubygems'
require 'rack'
require 'test/unit'
require "rack/test"

class HomepageTest < Test::Unit::TestCase
  include Rack::Test::Methods
  
  def app
    MyApp.new
  end
  
  def test_redirect_logged_in_users_to_dashboard
    get "/"
    assert_equal "http://example.org/", last_request.url
    assert last_response.ok?
    assert_equal "Hello World!", last_response.body
  end
end



class MyApp
  def call(env)
    [200, {"Content-Type" => "text/html"}, "Hello World!"]
  end
end