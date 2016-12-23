require 'net/http'
require 'json'
require 'nokogiri'

def parse_endpoint(uri)
  uri = URI(uri)
  JSON.parse(Net::HTTP.get(uri))
end

BOOKS_TO_PARSE = ARGV[0]

text = ''

BOOKS_TO_PARSE.to_i.times do |index|
  print "#{index}/#{BOOKS_TO_PARSE}\r"
  uri = "https://www.gutenberg.org/files/260#{index}/260#{index}-0.txt"

  content_response = parse_endpoint(uri)
  text += content
end

Couplets::Source.new(text: text).create_lines

