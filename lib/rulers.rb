require "rulers/version"
require "rulers/routing"
require "rulers/array"
require 'pry-byebug'
module Rulers
  binding.pry
  class Application
    binding.pry
    def call(env)
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      binding.pry
      text = controller.send(act)
      [200, {'Content-Type' => 'text/html'}, [text]]
    end
  end

  class Controller
    def  initialize(env)
      @env = env
    end

    def  env
      @env
    end
  end
end
