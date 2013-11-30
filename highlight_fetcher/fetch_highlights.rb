require 'kindle_highlights'
require 'yaml'
require 'htmlentities'

AMAZON = YAML.load_file(File.dirname(__FILE__) + "/amazon.yml")

puts "Loading Kindle highlights for #{AMAZON["email"]}.."

kindle = KindleHighlights::Client.new(AMAZON["email"], AMAZON["password"]) 

puts "Found #{kindle.books.size} books"


decoder = HTMLEntities.new

kindle.books.each do |key,array|
    begin 
        highlights = kindle.highlights_for(key)
        if highlights.size > 0
            puts array
            puts "#{highlights.size} highlights"
            puts "---------------------------------"
            highlights.each do |highlight|
                
                puts decoder.decode(highlight["highlight"])
                puts "Location: #{highlight["startLocation"]}"
                puts ""

            end
        end
    rescue Mechanize::ResponseCodeError
        puts "NOTE: got error from kindle here...."
        puts
    end
   
end

