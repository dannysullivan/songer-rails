require 'spec_helper'
require 'rails_helper'

describe TwitterBot do
  describe '#couplet' do
    it 'returns a pair of rhyming lines' do
      allow_any_instance_of(Lyricist).to receive(:rhyming_lines_string)
        .and_return("this is a line\nit is just fine")
      twitter_bot = TwitterBot.new
      expect(twitter_bot.couplet).to eq ("this is a line\nit is just fine")
    end
  end
end
