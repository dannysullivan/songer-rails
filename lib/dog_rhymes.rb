class DogRhymes
  def self.tweet
    client.update(couplet)
  end

  private

  def self.couplet
    lyricist = Lyricist.from_source_file('dog_wiki_page')
    lyricist.rhyming_lines_string((4..7).to_a.sample)
  end

  def self.client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['DOG_RYHMES_SECRET_KEY']
      config.consumer_secret     = ENV['DOG_RHYMES_CONSUMER_SECRET']
      config.access_token        = ENV['DOG_RHYMES_ACCESS_TOKEN']
      config.access_token_secret = ENV['DOG_RHYMES_ACCESS_TOKEN_SECRET']
    end
  end
end
