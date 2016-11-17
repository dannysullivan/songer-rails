require 'rails_helper'

describe Couplets::LyricsController do
  describe '#index' do
    it 'creates a new lyric' do
      expect(Couplets::Lyric).to receive(:new)
      get :index
    end
  end
end
