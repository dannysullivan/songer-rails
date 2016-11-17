require 'rails_helper'

describe Couplets::LyricsController do
  describe '#index' do
    it 'creates a new lyric if sources have been added to the database' do
      allow(Couplets::RhymeGroup).to receive(:first).and_return(double(:group))
      expect(Couplets::Lyric).to receive(:new)
      get :index
    end

    it 'does not create a new lyric if sources have not been added to the database' do
      allow(Couplets::RhymeGroup).to receive(:first).and_return(nil)
      expect(Couplets::Lyric).not_to receive(:new)
      get :index
    end
  end
end
