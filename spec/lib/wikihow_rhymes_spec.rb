require 'rails_helper'
require Rails.root.join('lib', 'wikihow_rhymes')

describe WikihowRhymes do
  describe '#tweet' do
    it 'gets a couplet and makes a request to the twitter api' do
      expect_any_instance_of(Twitter::REST::Client).to receive(:update)
        .with("this is a line\nit is just fine")

      allow(File).to receive(:read).with('config/sources/wikihow_couplets.txt')
        .and_return("this is a line / it is just fine")

      WikihowRhymes.tweet
    end
  end
end
