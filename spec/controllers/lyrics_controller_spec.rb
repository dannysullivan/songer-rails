require 'rails_helper'

describe LyricsController do
  describe '#index' do
    it 'creates a new lyric if sources have been added to the database' do
      lyric = double(:lyric, lines: [double(:line, text: 'word')])
      allow(Couplets::RhymeGroup).to receive(:first).and_return(double(:group))
      expect(Lyric).to receive(:new).and_return(lyric)
      get :index
    end

    it 'does not create a new lyric if sources have not been added to the database' do
      allow(Couplets::RhymeGroup).to receive(:first).and_return(nil)
      expect(Lyric).not_to receive(:new)
      get :index
    end

    it 'displays a title pulled from the first line' do
      lyric = double(:lyric, lines: [double(:line, text: 'word')])
      allow(Couplets::RhymeGroup).to receive(:first).and_return(double(:group))
      allow(Lyric).to receive(:new).and_return(lyric)
      get :index
      expect(assigns(:title)).to eq 'Word'
    end
  end
end
