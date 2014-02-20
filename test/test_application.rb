# rulers/test/test_application.rb

require_relative "test_helper"

class TestApp < Rulers::Application
end

class RulersAppTest < Test::Unit::TestCase
 include Rack::Test::Methods 

 def  app
   TestApp.new
 end

 def  test_request
   get "/"
   assert last_response.ok?
   assert  last_response.status  == 200
   body = last_response.body
   assert body["Hello"]
   content_type = last_response.headers['Content-Type']
   assert content_type == 'text/html'
 end
end


