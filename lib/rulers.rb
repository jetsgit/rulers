require "rulers/version"
require "rulers/routing"
require "rulers/array"
require "rulers/controller"
require "rulers/util"
require "rulers/dependencies"
require "rulers/file_model"
require 'pry'
require 'pry-byebug'
module Rulers
  class Application
    def call(env)
        
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type'  => 'text/html'}, []]
      end

      if env['PATH_INFO'] == '/'
        resp = Rack::Response.new
        resp.redirect("http://127.0.0.1:3001/quotes/a_quote")
        resp.finish
      else
        klass, act = get_controller_and_action(env)
        controller = klass.new(env)
          text = controller.send(act)
        [200, {'Content-Type' => 'text/html'}, [text]]
      end
    end
  end
end
