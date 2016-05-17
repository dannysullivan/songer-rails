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
      config.consumer_key        = ENV['twitter_secret_key']
      config.consumer_secret     = ENV['twitter_consumer_secret']
      config.access_token        = ENV['twitter_access_token']
      config.access_token_secret = ENV['twitter_access_token_secret']
    end
  end
end
