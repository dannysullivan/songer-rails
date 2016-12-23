require 'net/http'

def parse_endpoint(uri)
  uri = URI(uri)
  Net::HTTP.get(uri)
end

BOOKS_TO_PARSE = ARGV[0]

BOOKS_TO_PARSE.to_i.times do |index|
  print "#{index}/#{BOOKS_TO_PARSE}\r"
  uri = "https://www.gutenberg.org/files/260#{index}/260#{index}-0.txt"

  content = parse_endpoint(uri).delete("\n")
  Couplets::Source.new(text: content).create_lines
end


