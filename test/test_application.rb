# rulers/test/test_application.rb

require "erubis"
require_relative "test_helper"

class TestController < Rulers::Controller
  def  index
    "Hello" #Not rendering a view
  end
end
class TestApp < Rulers::Application
  def get_controller_and_action(env)
    [TestController, "index"]
  end 
end

class RulersAppTest < Minitest::Unit::TestCase
  include Rack::Test::Methods 

  def  app
    TestApp.new
  end

  def  test_request
    get "/test/index"
    assert last_response.ok?, "Error in last_response.ok?"
    assert  last_response.status  == 200, "Error in response.status"
    body = last_response.body
    assert body["Hello"], "Error in body[]"
    content_type = last_response.headers['Content-Type']
    assert content_type == 'text/html', "Error in content_type"
  end

  def test_render
    template = <<TEMPLATE
  This is a template for testing render <%= stuff %>
TEMPLATE

      eruby = Erubis::Eruby.new(template)
      output = eruby.result(:stuff => "Good Stuff")
      assert output.include?("Good Stuff"), "Error in erubis"
  end

end


