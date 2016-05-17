class TwitterBot
  def initialize
    @lyricist = Lyricist.from_source('dog_wiki_page')
    self
  end

  def couplet
    @lyricist.rhyming_lines_string((4..7).to_a.sample)
  end

  def tweet
    client.update(couplet)
  end

  private

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_SECRET_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end
end
