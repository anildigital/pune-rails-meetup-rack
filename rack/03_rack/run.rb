require 'rock'
require 'rubygems'
require 'rack'
require 'thin'

Rack::Handler::Thin.run Rock.new, :Port => 9292