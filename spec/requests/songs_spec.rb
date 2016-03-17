require 'spec_helper'
require 'rails_helper'

describe "Songs" do
  describe "#get .mid format" do
    it 'returns a midi version of the song' do
      FactoryGirl.create(:song)

      get '/songs/1.mid'

      expect(response).to be_success
      expect(response.header["Content-Type"]).to eq "audio/midi"
    end
  end
end
