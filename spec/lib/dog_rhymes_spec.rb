require 'rails_helper'
require Rails.root.join('lib', 'dog_rhymes')

describe DogRhymes do
  describe '#tweet' do
    it 'gets a couplet and makes a request to the twitter api' do
      expect_any_instance_of(Twitter::REST::Client).to receive(:update)
        .with("this is a line\nit is just fine")
      expect_any_instance_of(Lyricist).to receive(:rhyming_lines_string)
        .and_return("this is a line\nit is just fine")

      DogRhymes.tweet
    end
  end
end
