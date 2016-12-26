class LyricsController < ApplicationController
  def index
    if Couplets::RhymeGroup.first
      @lyric = Lyric.new
      @title = @lyric.lines.first.text.split(' ').sample.titleize
    end
  end
end
