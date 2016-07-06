class WikihowRhymes
  def self.tweet
    client.update(couplet)
  end

  private

  def self.couplet
    couplets = File.read('config/sources/wikihow_couplets.txt').split("\n")
    couplet = couplets.sample
    couplet.gsub(' / ', "\n")
  end

  def self.client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['WIKIHOW_RHYMES_SECRET_KEY']
      config.consumer_secret     = ENV['WIKIHOW_RHYMES_CONSUMER_SECRET']
      config.access_token        = ENV['WIKIHOW_RHYMES_ACCESS_TOKEN']
      config.access_token_secret = ENV['WIKIHOW_RHYMES_ACCESS_TOKEN_SECRET']
    end
  end
end
