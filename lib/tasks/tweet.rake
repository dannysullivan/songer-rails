desc "Tweet a dog rhyme"
task :tweet => :environment do
  twitter_bot = TwitterBot.new
  twitter_bot.tweet
end
