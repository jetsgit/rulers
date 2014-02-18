require "rulers/version"

module Rulers
  Class Applications 
    def call(env)
      [200, {"Content-type" => 'text/html'}, ["Hello from Ruby on Rulers!"]]
    end
  end
end 
