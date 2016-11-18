require 'net/http'
require 'json'
require 'nokogiri'

def parse_endpoint(uri)
  uri = URI(uri)
  JSON.parse(Net::HTTP.get(uri))
end

ARTICLES_TO_PARSE = ARGV[0]

text = ''

ARTICLES_TO_PARSE.to_i.times do |index|
  print "#{index}/#{ARTICLES_TO_PARSE}\r"
  random_uri = 'http://www.wikihow.com/api.php?action=query&list=random&rnnamespace=0&format=json'
  random_article_response = parse_endpoint(random_uri)
  random_article_id = random_article_response['query']['random'][0]['id']

  article_content_uri = "http://www.wikihow.com/api.php?action=parse&pageid=#{random_article_id}&format=json"
  article_content_response = parse_endpoint(article_content_uri)
  article_content = article_content_response['parse']['text']['*']
  page = Nokogiri::HTML(article_content)
  text += page.css('body').css('li').map(&:text).join("\n")
end

Couplets::Source.new(text: text).create_lines
