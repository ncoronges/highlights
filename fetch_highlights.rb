require 'kindle_highlights'
require 'yaml'

AMAZON = YAML.load_file(File.dirname(__FILE__) + "/amazon.yml")

puts "Kindle highlights for: ", AMAZON["email"]

# pass in your Amazon credentials. Loads your books (not highlights) on init, so might take a while                                                             
kindle = KindleHighlights::Client.new(AMAZON["email"], AMAZON["password"]) 



# returns a hash of your books, keyed on the ASIN, with the title as value
kindle.books.each do |key,array|
    print "Book: ", array, "\n" 
    #kindle.highlights_for(key) do |highlight|
    #    print "found highlight: ". highlights
    #end
end

