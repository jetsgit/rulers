# rulers/lib/rulers/file_model.rb
require "pry-byebug"
require "multi_json"
module Rulers
  module Model
    class FileModel
      def  initialize(filename)
        @filename = filename
        # If filename is "dir/37.json", @id is 37
        basename = File.split(filename)[-1]
        @id = File.basename(basename, ".json").to_i
        obj = File.read(filename)
        @hash = MultiJson.load(obj) unless obj == ""
      end

      def  [] (name)
        if name
          @hash[name.to_s]
        else
          @hash[""]
        end
      end

      def  []=(name, value)
        @hash[name.to_s] = value
      end

      def  self.find(id)
        FileModel.new("db/quotes/#{id}.json")
      rescue
        return nil
      end

      def self.find_all_by_submitter(submitter)
        files = Dir["db/quotes/*.json"]
        quotes = files.map { |f| FileModel.new f unless f == nil }
        quotes_by = []
        quotes.each do |q|
          if  q["submitter"] == submitter
            quotes_by << q
          end
        end
        quotes_by
      end

      def  self.all
        files = Dir["db/quotes/*.json"]
        files.map { |f| FileModel.new f}
      end

      def self.save(file, attrs)
        File.open(file, "w") do |f|
          begin
            f.write  MultiJson.dump(attrs) 
          rescue IOERROR => e
            "Unable to save file"
          ensure
            f.close unless f == nil
          end 
        end
      end

      def  self.create(attrs)
        hash = {}
        hash["submitter"] = attrs["submitter"] || ""
        hash["quote"] = attrs["quote"] || ""
        hash["attribution"] = attrs["attribution"] || ""

        files = Dir["db/quotes/*.json"]
        names = files.map {|f| f.split("/")[-1]}
        highest = names.map {|b| b[0...-5].to_i}.max
        id = highest + 1

        File.open("db/quotes/#{id}.json", "w") do |f|
          f.write <<TEMPLATE 
{
  "submitter": "#{hash["submitter"]}",
  "quote": "#{hash["quote"]}",
  "attribution": "#{hash["attribution"]}"
}
TEMPLATE
        end
        FileModel.new "db/quotes/#{id}.json"
      end
    end
  end
end
