# rulers/lib/rulers/routing.rb
require 'rubygems'
require 'pry-byebug'

module Rulers
  class Application
    def  get_controller_and_action(env)
      _, cont, action, after = env["PATH_INFO"].split('/', 4) 
      cont = cont.capitalize # "People"
      cont += "Controller" # "PeopleController"
      binding.pry
      cntrlr_action = [Object.const_get(cont), action]
    end
  end
end
